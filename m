Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75503CDCBD8
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7B110FEF4;
	Wed, 24 Dec 2025 15:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYfg8sD5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsOiPKdz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591A110FEEF
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOEOQH4901995
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=9rZNuVa8CnntvIrXxV61Xq
 wtGpE082gcQ4QmaNOPH+g=; b=jYfg8sD5Ibj2ZDyYlUToEEvUn58NT+ISHl/PLw
 fMDQcgCW18hH4KBPNHOKK7fmruG8MtCBoPd4HIE44mFhl7tjyEptt60+e6lEVGjf
 M1psKMH5YBXS2WYY9rmwtqCTP85PIq4A8fr5YnAVg+DwFheNTKQu2fWz6lmWqxw9
 w+yKRpPQ/8a7jhQ8nsHTqAQw6fORC6UVhuFQiKYB3z+iY5TQynKH8wGBHpy1jIvY
 7LDGZQ5EZ/afw2uWpj0h+5ybv/lvy4XofZ6ORQKpKPSpaBSPVAOUjgUZBGeA9ZQ8
 rRfvtfRQk1WgfAnM5fFERdWSFubKVndiDnS/KAc1RtR5CESQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe0686-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so152193421cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590953; x=1767195753;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9rZNuVa8CnntvIrXxV61XqwtGpE082gcQ4QmaNOPH+g=;
 b=HsOiPKdzFucyeNJ5QFbETUAHVMeY10GtuK92PiBEAUQ/mnebLm7cnR0kug5arxg9Zl
 oQIORVDg75OS+scSz37NDnuu5ead7GytdTugp1skWJBem3bXZddVYzAs+JnOkFJI7+iZ
 O9a/XI/zgFHg0yX2sQ5gE7LYdJguysBsQ8ydA1qgDzBuIP8QK8EDeYhXzM4wSJlrEfRO
 pWeqeMUyMXDKffM+gflDQf47H+ezQwGw9cxDvm/6KYGHPjgiDY7jwMgv8gvG0WYD04BY
 ph0EH+VkciVY7GFRklcErjpyZrnELEienVxqvxCoY+t8EXjQih7nPdhhW7uVMEpaJDnN
 JMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590953; x=1767195753;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rZNuVa8CnntvIrXxV61XqwtGpE082gcQ4QmaNOPH+g=;
 b=Xs9RJXwwIXB5dXxjzDfgJVKU6pJF0EA6sPOktnYZg924f2taoq2m05FCo5akWZskqD
 u89vfjbfE+XMI6ZI2SJz0cLUlxJbCKQAL+qicTSmcDa2UMpphE+2LSxnhtQzLUgQlE7R
 nCp8xeiaQDWA3LIbie1bgOupkCbWPmtGPQm/EwTCZlzyggjOYbpCnMxnBXo59SO9YAXm
 BQSV1xonc6LfEAK6cRtv3gYHOxn6m6eJR90P48XrbO2BhEhFiJiLfFC91IYE1xpoQ6Wm
 ZQAnBSgxOuAYF+Se3DheXj51T9/qzKweQvFIGqjFA4pKLie31eZYwzBnVugrKVF1sVJq
 m4pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN8rEdLDUdCsDyhnMoTF14Y1bIdJadBQGOw6CpoJ4c6ohEDSlsoY/ARk20seFOJlw5ftqXObYxPoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrRx+LVJSCgbrexyhTy12Fy/Vvvj2+mHTuI2ORJvSJCJ4YffLU
 l++qvIdf0DkEsu3xXCuV2+OkS/7FLUAahFLW0UMcxD1PMFeGvzdX4B3GZoJaza5wSZN+59lVXXw
 GUmJ1dN66NqJx+93+CQXLItMYgaXrwx7/cSFe1ppBDcL2JZ3aBGplGas4Svv1/ROqjEtSs+dOZq
 h9FGA=
X-Gm-Gg: AY/fxX695xCJfFUrKRJa+UoUuO+AnN19WmPtQo+NO4aP2Ix8k9t83wkTSIJwao2Rsyu
 NuDXK65nHGRaJ6IF4dllsYhSOpqd/V5gKnp1ii6BFnR5yiei2ugnL1hZKxsQrTX/z9uQxUEs7Y/
 AOAaFLDCYpEj4uX6rR79XPvI4rujBe34LSnrEeY1zk4LwpNtNilgbllE7JvNm2JDNi89BHkdFqq
 5XQQvsH3Oa74FB4F016o7gydfNBM+rP5QPWmiVyjf1C73U0ejNBk9LalTGK68rbffuuPv4lIQrE
 4H+l6x4Bih0j73e6C0KOqQuCewbVdDWNPTPuS1foZWc/m/gkkBlAf9JzKUyOf06uyAPQMEQnVw6
 xhqOFs2wcMgt3IkxPQp7zznFc9KxMpR6StP28vnWXbzdtEyesIXPUPW+RcBRErqTW3/bTPvMNZL
 lz3w+sG1Ml4nZxzdFti5wMiTs=
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id
 d75a77b69052e-4f35f3a046emr290626401cf.8.1766590953475; 
 Wed, 24 Dec 2025 07:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9tUizjNjvN5kFwIndSIXJLx9sAh9ZAO5ojG0j4Kg2S8mfGTxGd1zM7LXKlT3ZP+d5kvRqoA==
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id
 d75a77b69052e-4f35f3a046emr290626051cf.8.1766590953047; 
 Wed, 24 Dec 2025 07:42:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Wed, 24 Dec 2025 17:42:29 +0200
Message-Id: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUJTGkC/23MTQ6CMBCG4auYrh3SmfJXV97DuEBapInQ2kqjI
 dzdwsqom0neSb5nZkF7owM77GbmdTTB2DGF2O9Y2zfjVYNRqRlxKrikEgblClDeOlBuEiDqS8t
 zlefIBUsj53Vnnht4OqfuTXhY/9r8iOt3o5AQv6mIgMAbjnWpJFVFdbQhZPepubV2GLJ02CpG+
 lTqH4WAAyJJ2aGUUtEfZVmWN7k2uxz5AAAA
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ta/qYs32Jwfwx4ESth9/S8fiyMW+OEkbVDgftlKxaeM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnJcVsXVPewZihIE79PolVWhyQTJgV7Uofv
 3a+G7DuZKaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1bYKB/9lkEHVrxnRw7uVQnqcVVNaqvUiHsIhfA9BC9YrGvHrRwkup9Tp6YbFZBeR4Fe7KUaNu2q
 e1JOapizAM10fdn5B3BlkOgciFQBbcuHlP1DoXq+OyUKpH2whijciN06mFOR1zmr2ZNIL4HOm6i
 /YkxrQNwWD/nl0UNnRmFkhpef2/ytgp82ArvkDQFrajhhOKWS5PPne5jBVdTj0XV1HDcwf+nfQa
 pcEnYKkG6GkXbv32l/cYneTqn/00Z/8fz75yLpQEGj5Z5+t9sLP19Gpw2KhNT07lNHt4I8wGftI
 FA3+5VrpTg+ZeNcwGtanHg7l9li7nJxNvL2jpu2ho4r95b+i
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfXyYEkoNfl4Akq
 zOURzUutXbOaIvJPMupbOD4oNZ2sRKGw5tDu4h4YUEPCSzfhXqRRO0HtD1en6h34iXDOUpU4Fj+
 H3lW6g/WKWCwkf+9WOXuqVqoSeFr/kljVY/4keFEp+go7ruD6Y3NVJ0vgM9s9JpUAO+TQk54BsL
 DI2Q7AocnQdkhKpiC8QvL5btOnEvNS447SrgxXRYcMYbf34nuACXTnOreWdmUPDZu0syvJVpk30
 4OV4qT1rBmoa9QFwVfUvFSBkjnmiHEyhzMAv9H3s4YiMOjhZklXdWg2+f5r2ffBIOiiFFTwsytS
 M4D5by5qDB4uy/KYHDVmGLUaLGI84X7V+rtrr4OtO5ajyJbbnLx7RyWmfOnz7ivMS0SkjLBvArq
 pMYa1er3npjD6GdwIjc/x7CDrs5Tbc8fMTM7r/28bRhepzcHRB1eF258c0Cl4E5nITEE6bWSqit
 oeWSPq8ZWaH+TCideNg==
X-Proofpoint-GUID: rx4Ieap8ajnu-JRdCPcPSltsL68aIpD8
X-Proofpoint-ORIG-GUID: rx4Ieap8ajnu-JRdCPcPSltsL68aIpD8
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694c09ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mGs35Nl9CTEAThm_-rEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240138
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

Fix commands pannels support on DPU 3.x platforms and drop support for
those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed commit message (Marijn)
- Reordered CTL_START checks to be more logical (Marijn)
- Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com

Changes in v2:
- Fixed CTL_START interrupt handling on DPU 3.x
- Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
 drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
 6 files changed, 15 insertions(+), 333 deletions(-)
---
base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry

