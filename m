Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F6B0FB89
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 22:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8732310E1A0;
	Wed, 23 Jul 2025 20:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWRprqyk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899D10E1A0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:34:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHBdwe020122
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=fQlGpsNQCbK1gjPImdLDa8PKdhHdOTCgiKm
 ZdGjhm48=; b=lWRprqykiY3dNoJHCUDUIwgJjbf1PQBoUiRCpySgHHpmhBXAiLq
 nEUHtjsHFTqhcG17+u03DD89DwkcL6OBRQW9qQTzf4Fc4f709XF7nCC1CHWFkn4e
 432y9D52/PQ9zHewR9SrYaJXwKuJIWtazzjK8HjyeaYl7ZE1cqwouS0hrHjcbBtT
 TYIOirFTwKWnCXrAgGKYFCR3ZAg22mt/X/e3M4C3z1mt+FdrhkFsVGG9ZUAYf5VW
 b99JQeqzPRYxXvOFieUhbR+/Wzg3cViQwhB8ulU0H+coEqLERF28n1HkzpvhTuEP
 c9TmQ9VFHKTTfIqtugwNQW+39zKou0BI6Xg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3es9ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 20:34:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-531acace335so232675e0c.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 13:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753302871; x=1753907671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQlGpsNQCbK1gjPImdLDa8PKdhHdOTCgiKmZdGjhm48=;
 b=jVgdhx3PrgZIiTevpZGH7UjuacDfGR7xkvuvV1bQEcCJZN8szzqNWbwtJ0i7AesV6g
 4/d3gTxyspgC4Wz3SBgbNmCITOLUFTgdBSZueRFhxpABNxx14XR/OH+Oo0DT76oDowBe
 26+NxTOE/H9guFixG7Obwb/keo7qkFeZDkg6WRg2QU9VC1tcH54L6Dl6u1SusyN5BOd/
 dCO3FFh6ZMZT+xJizwKtnoFekzzsuQx9Y7eXwbL4Fj9rpAwqLZRF6cPgR8OmfxQFTAJO
 POTcsPAXGy8cNgCr6Z2JJVikQwju8v75lv5L8dptpHiuV1wCCLpdlO3R7BTsJlgQfMTE
 seZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkpbTi0ZhgkRx7IuM8X8QY+hZWtxiPBN9V+apMjdGro5vaGaXv59ODnwhdrt7riL6h8q0kEtCNg+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNoHphWIc2u1IYaQW54TsKBNnAnHAr/D8tT6H9ZfL864NgDEF8
 EOGJyy0RZiDP7UW0vmMZED2qL8KAlHbZy3W7axrby/OEB6KOUsNXyV3V/AYieWe8+1yLEEwU4AL
 tVUJVy9ooqLSVhrqVX5ty7epUUWgO/6gctb3khKkK7qHs1SjIpiEVmt/RbMEOOSy/rfCsz0E=
X-Gm-Gg: ASbGncu2VZRlv/dbVdefmbU6F6+M8Welg2YCDGPXiduOQ5xAQVL7O+iPDdBF0e7CRq0
 num+aQHIdUbRecxd+tIJq67U5ahKM3h50HO17zlNUrd3hC40EmlM9C0fJiQZ5o37XTa/9NZ6iMG
 G6FlclHxZfZiUIShVVKljOZlZm+NtjTgoEX+D/ExOFqQIBsn2D/BAe9gTQyGAzM4RGVEkrgL1Mk
 vUnpomW25/Vmm5zO5aWZXxhTiwuKR9me23yR1BXBB/KruRv6XvW8Emz8bQM3X/lvLRbD9F32/WK
 2se5Gsk/n/TgxvD6XkayL+xXicg6VsOSgaeUw7iYLScapwmWfY8=
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31e506ef502mr5027757a91.5.1753302510490; 
 Wed, 23 Jul 2025 13:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY+35JICM9OLufVbYH7sIKIs/Pmj3SRnQsimqXzP4nhKSKMC/sT77ExrMVchp76VtVysP5aQ==
X-Received: by 2002:a17:90b:5448:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-31e506ef502mr5027735a91.5.1753302509999; 
 Wed, 23 Jul 2025 13:28:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e51b93862sm2307868a91.34.2025.07.23.13.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 13:28:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Defer fd_install()
Date: Wed, 23 Jul 2025 13:28:21 -0700
Message-ID: <20250723202825.18902-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nLVPeLO93G35SCkhVcbRqhgSVx7ml3vl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE3NSBTYWx0ZWRfX/0hH12wVPwyz
 LtGaYlV9xKuekXF2SgtH2EEQUdFsNs754wWFLvCihnZSxf8QX53/jUkEXxWWs9RGB/qmcQv+cTL
 1kpoV6IVwwx5U86R6VGI6RFMPkJy9ejReWFI+oYcvAb298VSbov4zG8twtvyqULqE+RWOUrpmC3
 Rh22uXQ5GpHXjB7niG82WOEB++/aQehgwQB/kLL+1Jtvu0NlgBWwR853lkykwtTPAfjo7F4fGLh
 NBuCi77I9caI+38oClQrN6NVU5Z4BPUkwAicstRaMQW+oZTJQZJ8HyTrnpoGso1iPVJiJO6Io3q
 86w6ejxYX1Tg6s/hq5mzwvLi++uqThG7DvBrsG/D9EvAQgKF3j+gQgE1SHJuKoAjzX5WVTFuBCE
 RafmmRWm4HbNXrNZCDO65yTuvSlMBQuVHOPf7h6UnIgg06JRJUgvLAE/BpOCDgOoG/Exnjhe
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68814759 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=jOvuQKYuLspqWEp0sh4A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: nLVPeLO93G35SCkhVcbRqhgSVx7ml3vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230175
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

The first patch fixes an issue that Dan Carpenter reported in
https://lore.kernel.org/all/55953f27-0762-4ef2-8dda-3208b34a5c75@sabinyo.mountain/
and the second fixes the same issue in the more recently introduced
VM_BIND ioctl.

Rob Clark (2):
  drm/msm: Defer fd_install in SUBMIT ioctl
  drm/msm: Defer fd_install in VM_BIND ioctl

 drivers/gpu/drm/msm/msm_gem_submit.c | 14 +++++++-------
 drivers/gpu/drm/msm/msm_gem_vma.c    | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.50.1

