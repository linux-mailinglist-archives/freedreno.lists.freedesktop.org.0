Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1623C6847A
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CC710E43A;
	Tue, 18 Nov 2025 08:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NC0WQNA6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kncoDfLy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FF210E43A
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8VgF52250590
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=SRkkuilcPUAjhzRDejyYeP
 xyyLFNh/VPNPEY8WYMKsg=; b=NC0WQNA66fUeDTOPjoVAVfv3es0rzYbJzjlwDi
 pAoq9As2AV1NFx/XCjolVXN92siVFAiAEElFCfqfH1dSFAZgUhKfa2XpdhkumKiR
 V0DHqYOopOm7mcbncKO/cuBw2RFou56fQUKZAG/KFKH3Mwmye7V8WtchSJ2iMKl2
 F5IRf0sUS+4bA97i4EIOyzSFo2XPIyAKtl6iTzRSIn/hkPHJ0LndoJBSHlBuQsFJ
 lvXhqKKyhLW5L1IiAVVnZ9lpZEbm3KnlEOYGdkRQubz0A1cp1LFMRYkt++0w13Ti
 NqVRk+GnBRtxKWqHM4cdx46GDnbRA2qS+ccNUtnglJvOB8Fg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g1m7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:51:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29557f43d56so65981765ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763455877; x=1764060677;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SRkkuilcPUAjhzRDejyYePxyyLFNh/VPNPEY8WYMKsg=;
 b=kncoDfLyik7YB/mtciwt7gEhuSZtvat7+xAJEK9cfmi5L6HJWJSeP1yj3cGH+FNT3C
 HJvWzLs3brl2FACa0vZiBYugTTgUY8wqwiWYzgplmnTydY84zTs9TXzG0tYDw2fbnpL3
 BJ7Y1nh07wqioEiYXC3U1fh01GhQxLC+R11LXZ4s5JTRCbsMQDROJdyxdeWnop9ePQih
 mBKa0ZrM6+OyKZEyn/++1IVqHTX8BV7RuBcB/DTAEF9ksCmcoAq9TzhUs9al4gKYFUrL
 IHnWdrT0LwjiEjmXOru4HJA8tebE97TcTealijUBTPQEW77ofHahQkJQTQfrnVqbSrFd
 DkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455877; x=1764060677;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRkkuilcPUAjhzRDejyYePxyyLFNh/VPNPEY8WYMKsg=;
 b=SHyo+7bSnZSL7SXF9GjHm5GuXuYz4c0EcvCB97rZ8TFDKc1GdEtbQ/AUeaKWkEb1ep
 DaommnoQOfF7c0GmBw0ZfwqnkKGLszqYOKBUsILOaEk1yDx4n6/XOc04ukooUonu2eJ+
 FaiR2hS4OvcBEuK0J1rJZnjHGh+hgdAs2EHNB7trjMDt6+hbiqaKke7346ALfZBj/UAJ
 JpTGBD9GxmDx072igd14RpWjUfv9q5RbO5rrUiStDRVtW1VoBFdoRaoJJpVINIM3e8p3
 Cmaz/ahAp3JUovkOiC5jPQnlI0ieE3BSLVeQr5WmyXKzuuUT6debMZbRH3qGu/VbZiG4
 h06g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuzz2UAmdwgaPoWelscDKDezsrhsoSB2PYmrodBjP6lBmg+zPXpoyY28LkCSp0zM0Jf+Mnr4DKDL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMgluUzbuk+87d0EAwYynGUkLatuMMBfZi7krIRBxG0TKJIVgS
 /gM9zcZvTDhCSp+N+c86drAh4bdlWAZU2pFVXZQcSdAJM2LDfCnCE9xzjbQqLyhjkr5swnwDOCG
 r9Y7m551VVBFUCCd8phs0pOyYOB1yWl3dzRYRZFkb3G7lmcSZKj9cv7at+a6tqR19gs9DgVE=
X-Gm-Gg: ASbGncsWOvROBkvmCLvyypBIwzq2X6+fgNajnuVH6DxNNOTZgAhkM1BrjZskiPAfFiy
 Tgzth4R7tjW4J7lUPjwgW7Yc+TtUwsf3khybq0i54SrbRck9Vg0+t4n702dcU8J/6Ct4eJZ/wu2
 lHuxDJlL4c0sd/UycV1NERAxqz/6pQhVBvp3toDTj4/QJMWx97IVw/HA5RgEDCt7TMljwswsnq1
 u54eAK/l58vxxA6TdpEZfgMwqJi7v7I5XVcIDYruO6PPvxgWDPvHqCuNQXQMPwu3QgGKzdH30fD
 F0fnETn8HrqmtySdrUNYd0lEmZZ2JVdOzwoln1mbFub1/NBEOEjO66tYx6z4VDHgfqNbXSvYtym
 mkh8NGOA1aWKsVhEnm7iZhe8=
X-Received: by 2002:a17:902:f68e:b0:296:217:33ff with SMTP id
 d9443c01a7336-2986a74b123mr185486125ad.48.1763455877229; 
 Tue, 18 Nov 2025 00:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYYYhbl132uZmTkXE/2ietVevW1XydVKATVhI8QMWfD22oOohwN7WRKOFoGbfJdJDmskWADw==
X-Received: by 2002:a17:902:f68e:b0:296:217:33ff with SMTP id
 d9443c01a7336-2986a74b123mr185485645ad.48.1763455876671; 
 Tue, 18 Nov 2025 00:51:16 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:51:16 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 00/22] drm/msm/adreno: Introduce Adreno 8xx family support
Date: Tue, 18 Nov 2025 14:20:27 +0530
Message-Id: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQzHGkC/33QwYqDMBAG4FeRnDclkyhWKcu+R+khJmMbdqM2o
 9Kl+O4bIyx7cHsJ/IH5fmaejDA4JFZnTxZwduT6Lob8LWPmprsrcmdjZlLIQlSy4p9ad5pfh4n
 TNAx9GDmAlWCOrQZrWJwbArbukczzZcsB71Okx+2TNZqQm957N9aZJ887fIzrqEcinTrr7LRVK
 rFTOQMHXqpCiUaUQqD96IkO90l/reohPu9srb45GvvwnbabIXW/VsVrNaGz/IUAYBeSEWqwhaM
 2tsAq/wdSf6F8D1IRqqQSwpQYT9zuQMuy/ADBqwWgxgEAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=9653;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UFF8oQMxcaD0GgqaF/ebE2x2xvKFCkvuU6Qn6dDSTEE=;
 b=DlL0N9F/+fnn/Htox9AmbWYWj9jhuEgWRpocf3vH1plZpfPAu15H5LRKwVGjeKxu113eoyehw
 hwCLsvmg+dCA8heY7f9qQpGg4+vlIGLBa9V7Dah7WUklZBqFuxZu4kp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ZDCmxKdzAj3E2ASYGlKBpTWZ5cX9At6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX7cKRBUqCsXqA
 SQjdC1IzuaGfKiObsa0QIzv2q9Nx2w0FYaXivOBpqoKsIASbIPDHXkjjTUC9Snq1qyNqeFykwCk
 D4Loh4+FaWkePwE8bMxxH/MTzqQgnQnQD6yT3EBPQZNycLnQGHhpwoloAASsKU1QMR32QHZogAH
 tv8F7jkIGQZIr3skhsUYLCsTqhY0snmECJUhvuf7VjJsgUdJ+PurMvXoQaEsP8eKPt2wA2Gslwk
 T7CxOv1j8pT/uUAKF/KdZtgo5sLyHC4JbGP+1z3ry5ZvXWf9MTpdEKIa6Kxywl7gkO8aLaJ9Wih
 peyYClc/zFV/s5pVtoKBYRY3ZFaX40mNkZkhURIrDAmD81wmxwchBSW8EjBwO7XnrkfTYEkM2j0
 HztDbsr2HavhfFAH4PigF6IGvngw9A==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c3386 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8
 a=yBg-79ffRpHudLaTDJsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ZDCmxKdzAj3E2ASYGlKBpTWZ5cX9At6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

From KMD-HW SWI perspective, there is significant register shuffling in
some of the blocks. For slice or aperture related registers which are
virtualized now, KMD/crashdumper has to configure an aperture register
to access them. On the GMU front, there are some shuffling in register
offsets, but it is manageable as of now. There is a new HFI message to
transfer data tables and new power related features to support higher
peak currents and thermal mitigations.

Adreno 840 GPU is the second generation architecture in the A8x family
present in Kaanapali (a.k.a Snapdragon 8 Elite Gen 5) chipset [1]. It
has a maximum of 3 slices with 2 SPs per slice. Along with the 3-slice
configuration, there is also another 2-slice SKU (Partial Slice SKU).
A840 GPU has a bigger 18MB of GMEM which can be utilized for graphics
and compute workload. It also features improved Concurrent binning
support, UBWC v6 etc.

Adreno X2-85 GPU present in Glymur chipset is very similar to A840
architecturally. So adding initial support for it requires just an
additional entry in the catalog with the necessary register lists.

This series adds only the driver side support along with a few dt bindings
updates. Devicetree patches will be sent separately, but those who
are interested can take look at it from the Qualcomm's public tree [2].
Features like coredump, gmu power features, ifpc, preemption etc will be
added in a future series.

Initial few patches are for improving code sharing between a6xx/a7xx and
a8x routines. Then there is a patch to rebase GMU register offsets from
GPU's base. Rest of the patches add A8x HWL and Adreno 840/X2-85 GPU
support.

Mesa support for A8x/A840 GPU is WIP and will be posted in the near
future.

The last patch in the series ("drm/msm/a8xx: Add UBWC v6 support") has a
compile time dependency on the below patch from the qcom-soc tree
("soc: qcom: ubwc: Add config for Kaanapali"):
https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

[1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
[2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb72c27909d56660db6afe8e3e08a09bd83a284

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of msm-next
- Clean up AQE bo during a6xx_destroy (Konrad)
- Split out UBWC v6 support into a separate patch to ease merge (Rob)
- Rebase gmu register list's offsets in a6xx_gpu_state
- Add a new patch#1 to fix Out of boud register access
- Link to v3: https://lore.kernel.org/r/20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com

Changes in v3:
- Squash gpu smmu bindings patches for Kaana and Glymur (Krzysztof)
- Reuse a6xx_flush() and drop the patch that added submit_flush callback
- Fix GBIF configs for a640 and a650 family (Konrad)
- Add partial SKU detection support
- Correct Chipids in the catalog
- Add a new patch to drop SCRATCH reg dumps (Rob)
- Read slice info right after CX gdsc is up
- Don't drop raytracing support if preemption is unsupported
- Drop the unused A840 pwrup list (Konrad)
- Updates to A840 nonctxt list (Rob)
- Capture trailers
- Link to v2: https://lore.kernel.org/r/20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com

Changes in v2:
- Rebase on top of next-20251110 tag
- Include support for Glymur chipset
- Drop the ubwc_config driver patch as it is picked up
- Sync the latest a6xx register definitions from Rob's tree
- New patch to do LRZ flush to fix pagefaults
- Reuse a7xx_cx_mem_init(). Dropped related patch (Connor)
- Few changes around cp protect configuration to align it with downstream
- Fix the incorrect register usage at few places
- Updates to non-ctxt register list
- Serialize aperture updates (Rob)
- More helpful cp error irq logging
- Split A8x GMU support patch (Dmitry)
- Use devm_platform_get_and_ioremap_resource in GMU init (Konrad)
- Link to v1: https://lore.kernel.org/r/20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com

---
Akhil P Oommen (22):
      drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
      drm/msm/a6xx: Flush LRZ cache before PT switch
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/a6xx: Skip dumping SCRATCH registers
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
      drm/msm/a6xx: Share dependency vote table with GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      drm/msm/a8xx: Add support for Adreno X2-85 GPU
      dt-bindings: arm-smmu: Add Kaanapali and Glymur GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU
      dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU
      drm/msm/a8xx: Add UBWC v6 support

 .../devicetree/bindings/display/msm/gmu.yaml       |   60 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   50 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   13 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  371 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  287 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  399 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   31 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   74 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1205 ++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   38 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1954 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 37 files changed, 5043 insertions(+), 1684 deletions(-)
---
base-commit: 50a0b122cfc8a7dc35009ef9bf33cf6034c7bd69
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc
prerequisite-message-id: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
prerequisite-patch-id: f15bd99b078d228da892fb1224e10cac31f4a5c2
prerequisite-patch-id: 5b3d152595fbcce7c118d42c00f89160bbf03d41
prerequisite-patch-id: 4387aff0073a3217132ae5da358e5d4b2cb23cb3
prerequisite-patch-id: e047a6ea27db881db0089923af688c38729a7dad
prerequisite-patch-id: e686f7f592194f7d5e943858ce4dab49da6f4d18
prerequisite-patch-id: 638bc6f946cb2c1a2c68c3713a1ce7e6839c3465
prerequisite-patch-id: a85a264e87f79e9ac34dc22124153b050f97dded
prerequisite-patch-id: 8bba83cdb88cb7a8851978590cb24033d95c21de
prerequisite-patch-id: 9f08bcf9e33501478a2312e7a317f730f167652d
prerequisite-patch-id: 65a2884909f6f0e3f111412388fde0c18a4a3334
prerequisite-patch-id: 3e9a011409f3461e3de7b1a8a4e99de6fbf02abf
prerequisite-patch-id: 0ae4c8dc17fd54c84d903badccdf7a2018ec5606
prerequisite-patch-id: 6e0829024fb62bfc4510ef4c5472392dc76efcbf
prerequisite-patch-id: 5e5e177cb37fd1c0151568744565483809f357ba
prerequisite-patch-id: c2236f76a9fda88c41ea535708be1b51fd4d444c
prerequisite-patch-id: 6e26922186365d994987026b674baa66f9ac0139
prerequisite-patch-id: 784df303a9e75f062c1e069d2bdb88578a76ba0e

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

