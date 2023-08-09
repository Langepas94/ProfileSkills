//
//  ViewController.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import UIKit

enum Section: String, CaseIterable {
    case skills = "skills"
}

final class MainResumeViewController: UIViewController {
    
    // MARK: - Static
    static let sectionHeaderElementKind = "section-header-element-kind"
    static let sectionHeaderElementKind2 = "section-headers-element-kind2"
    static let sectionFooterElementKind = "section-footer-element-kind"
    
    // MARK: Private properties
    
    private var skillsCollection: UICollectionView! = nil
    private var dataSource: UICollectionViewDiffableDataSource<Section, ResumeItem>! = nil
    private var viewModel: MainScreenViewModelProtocol
    private var editingIs = false
    private var alertTapped: ((Bool) -> Void)?
    
    
    // MARK: - ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }
    
    @objc func presentAlert() {
        let alertController = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым владеете", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { action in
            self.dismiss(animated: true)
        }
        let addAction = UIAlertAction(title: "Добавить", style: .default) { action in
            if let textField = alertController.textFields?.first, let text = textField.text {
                
                self.viewModel.passHabit(ResumeItem(text: text))
                self.configureDataSource()
                self.skillsCollection.reloadData()
            }
        }
        alertController.addTextField { textfield in
            textfield.placeholder = "Введите название"
            
        }
        alertController.addAction(addAction)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
    init(viewModel: MainScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - Setup Collection

extension MainResumeViewController {
    
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseID)
        collectionView.register(AddSkillCell.self, forCellWithReuseIdentifier: AddSkillCell.reuseID)
        
        collectionView.alwaysBounceVertical = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: MainResumeViewController.sectionHeaderElementKind,
            withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: MainResumeViewController.sectionFooterElementKind, withReuseIdentifier: FooterView.reuseIdentifier)
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: MainResumeViewController.sectionHeaderElementKind2, withReuseIdentifier: ProfileHeaderView.reuseID)
        collectionView.backgroundColor = .systemGray6
        skillsCollection = collectionView
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch (sectionLayoutKind) {
            case .skills: return self.generateSkillSection()
                
            }
        }
        layout.register(SectionBackground.self, forDecorationViewOfKind: "background")
        return layout
    }
    
    // MARK: - Setup Section
    
    func generateSkillSection() -> NSCollectionLayoutSection {
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .absolute(42))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: layoutSize)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(52)
            ), subitems: [layoutItem])
        group.interItemSpacing = .fixed(14)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18)
        
        let section = NSCollectionLayoutSection(group: group)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(42))
        let headerSize2 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(0.45))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: MainResumeViewController.sectionHeaderElementKind, alignment: .top)
        let sectionHeader2 = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize2,
            elementKind: MainResumeViewController.sectionHeaderElementKind2, alignment: .top)
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(100))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: MainResumeViewController.sectionFooterElementKind, alignment: .bottom)
        
        section.boundarySupplementaryItems = [sectionHeader2, sectionHeader, sectionFooter]
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        section.decorationItems = [backgroundItem]
        return section
    }
}

// MARK: - Setup DataSource

extension MainResumeViewController {
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
        <Section, ResumeItem>(collectionView: skillsCollection) {
            (collectionView: UICollectionView, indexPath: IndexPath, resumeItem: ResumeItem) -> UICollectionViewCell? in
            
            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .skills:
                let viewItems = self.viewModel.getHabits().count
                
                if self.editingIs && indexPath.item  == viewItems {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddSkillCell.reuseID, for: indexPath) as! AddSkillCell
                    return cell
                } else {
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SkillCell.reuseID,
                        for: indexPath) as! SkillCell
                    cell.configure(text: resumeItem.text, isEditing: self.editingIs)
                    
                    cell.deletingClosure = {
                        self.viewModel.deleteItem(indexPath.row)
                        self.configureDataSource()
                    }
                    return cell
                }
            }
        }
        
        // MARK: - Supplementary Items
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            switch kind {
            case MainResumeViewController.sectionHeaderElementKind :
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderView.reuseIdentifier,
                    for: indexPath) as! HeaderView
                let allData = self.viewModel.giveAllData()
                supplementaryView.configure(image: allData.profileImage, name: allData.nameData, detail: allData.detailData, locationText: allData.location)
                supplementaryView.editingTapped = { bool in
                    self.editingIs = bool
                    self.configureDataSource()
                    self.skillsCollection.reloadData()
                }
                return supplementaryView
            case MainResumeViewController.sectionFooterElementKind:
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: FooterView.reuseIdentifier,
                    for: indexPath) as! FooterView
                return supplementaryView
            case MainResumeViewController.sectionHeaderElementKind2:
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeaderView.reuseID, for: indexPath) as! ProfileHeaderView
                
                let allData = self.viewModel.giveAllData()
                supplementaryView.configure(image: allData.profileImage, name: allData.nameData, detail: allData.detailData, locationText: allData.location)
                return supplementaryView
            default:
                assertionFailure("Handle new kind")
                return nil
            }
        }
        
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, ResumeItem> {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, ResumeItem>()
        let allSkills = viewModel.getHabits()
        
        snapshot.appendSections([Section.skills])
        snapshot.appendItems(allSkills)
        
        if self.editingIs {
            snapshot.appendItems([ResumeItem(text: "+")])
        }
        return snapshot
    }
}

// MARK: - Adding New Item

extension MainResumeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if editingIs && indexPath.row == self.viewModel.getHabits().count {
            presentAlert()
        }
    }
}
