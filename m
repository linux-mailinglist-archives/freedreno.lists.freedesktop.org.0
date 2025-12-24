Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993ECCDCBE1
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769910FEF5;
	Wed, 24 Dec 2025 15:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqUyzvCO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6ndZbrO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27A510FEF3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO7s2sW1056227
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=; b=WqUyzvCOmyOTyVbS
 z3mMnMNLOuDYRfMYZ7nZ9pdFd4a1vjL2LD7723h0zci3LkOtyMgV9IB7F9vUTb3G
 akXo+scN5oW1WcXZ0vh5KucNQ349zI1FZdjmL3TkOIET9RNvDAPM3hUgomv7XXTl
 NGtLkq72v0AtvOm7I/vq812JYsEOfldGVHL8u2HhTaxwkPro4mk2lv2gCzqpvEz7
 lF93TPoIlfM1zl8CQbmiuLXtGvjJmmY/n0+TukzWrXPgAtVNhgheeEBm0dHP9reH
 QHQfMg/r3lv+kkFuwm1awKeitM+HrjheN3ivJ7ibB3ZXu9xlZB5YNIK9Kng425tN
 7ZglRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2u0r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0488e746so130102781cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590955; x=1767195755;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=;
 b=H6ndZbrOfCpwX64ovBuigEO05ISt4FQzwEFexCQpaK5Qha0I0zhHLUKgzx//Mrmr7i
 xaJB9i/qGYL+OlrBuWWN+65STKyCAi22cyVZGQwcF63XJ/FLsg3PmwN17r5DoCHpMtSn
 fT6hjAvoGSFssFC7lbg+n2JPRTaIZajaY/7tFDkBaPDPXmfhlMCPpfHZ6RQpUwDeGyZw
 vLQI/A83RgCxdb7IvlH2ZfQHQgfSxko5WFzH579NT8VBc0u+xcx0K1dFzyucmAsKUoDi
 zVOpBq4cNBWoNca0QZkvo+5vffchZPDHjv/gI4rtSk7HwiXr4BmheBCwlNojdcU2V0Z3
 C7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590955; x=1767195755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=;
 b=UbNLSg3158NGf/qRBt004JH8D/ojAEneu1R4vrzA7GldR1+PkO1qw/DIis+pouEijK
 7mxk2J4RE4bot47ZUXudOZNu4ZmrpvRdCutZoE/OQAPnKgkszZKI1kK/MQu0CQmYeXVb
 D6XKHDdmkIxGcKQBXo4BtSEJO1r/O9fqAg9m2vORFBMPL2VWHTlFJ/WBN07uinjHaXuq
 6ZK5DxKFGX/fKVTSVWlnT2EfYUsZfFBlJTGirRfIKR/X3l8+bNAKoOOAU5wRM9MJ2Vcu
 D+jJ3aHMj+scI619mjuRTspRsMEQ+0jdOZc4YC3RhutL9+Oppi+oujFaiFBfErPiFYDy
 le3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUptpY2kpsOZJd/bJrTAXfFnf1BiZD6iqOIfinWrDhektXGCdOHZXOVk5RKp01Ay8V/71z7ZiixCKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRbHMiqHJedebNuZiTRBA9ndMW/cSTOuLNom99Kdpc2xQCmfZe
 4I9ZBXzEvDmQpqppGK5ic9I87ovqmQQ5eXfsJ3DdNrKETWfvCCYQlRNHUNNj9ZIeBlxl4W+XNRf
 Sxzb+wvzExiTV04Zocw563GK01x9fF2Ct3+OK9VBJeKDdjaFRamO1e5H3dMPtvAjCFThHcPQ=
X-Gm-Gg: AY/fxX5thd9zvDimT6r66iNbSMuTAiNOfTMplAOKfhwGhzk3MKnxxIFwp7CtggOdcPw
 mguvZS/8uirFhN/zJ3kkPEdtYw/QSnE1AAYkUQE4ON6eNJijdtT8S4kfBk045hqFaEU5UO0LrKJ
 7uiFX0ma47FrfmuYO3RLc2fuW7Zj8p7u/NaxMg1F6isHEr/oZIWYl80lQNdpQ0p4ABHiXB/UarQ
 BJPugITqdiXlXEZ/sISM/Q5EXxE+B3FR3rBCq/0+vjK2TxnX2VHLFu8BMIiB+UmY9t4Fw+tkQYQ
 O9Xxc39BOBz5LP1tQlFkAU4JnPiYkikMt/QDhRVP3Obqd9OWSwKUb4SZsgxr9OkWvZisggxxqav
 o5MWKq+C123hk54nOtpuJ7KxNpz4giWSjFmrr9FDuF1VLWB367yV8FWf+sYbDK2NGyp7409RUki
 VKByUAA9+Ko6jY9mwhFEtGLak=
X-Received: by 2002:a05:622a:30d:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4f35f455b63mr296327751cf.28.1766590955515; 
 Wed, 24 Dec 2025 07:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmmwuYonY8fQpi68f95jCRpUXmpjaX2sHqB/7H6bAV9sQQd21Yjoeg4KD5j0vLzPzYWCgzUg==
X-Received: by 2002:a05:622a:30d:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4f35f455b63mr296327421cf.28.1766590955097; 
 Wed, 24 Dec 2025 07:42:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:31 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-2-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/MJ75vhsI5cjj4o92iPu5gq8x/vgx9is2mnNAWB6edk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlMCeehXSUbi4oIEysRtaTYV82kp6fPSKz0qxAudd3ZbyiHs
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpTAnnAAoJEIs8ij4CKSjVpYUIAINc
 jhZ0GS07jX+JaZ6RIjwLf4EnHghhkF8Ljv25l2LrEhuGSLdFXOZJA5AizKoC6B5zSZITozzTGXF
 swym0Mwgf9NJGZn1cQniwIIocKxjfa4fwdPa4I3+1Si3afkSX20b/C8BSSOGXYVIM0tLGPJpJjg
 UIUVBnHgvOZpWYzJn84o6pmBJEh2TI4jui7i4GnyUAQadF6NPOZazfaPcw01PK9VmHofFFI1KQF
 6ROzVGBiz88+cQSZgRHZZfCJYyxpSyBz07i7pnziU6lMZoI6AttT6Ah1MyyHyaZEPbocKIHJTy8
 XsDFIEKuZSeqqeT06SrV+7vlyj493Xf+KrLRxFg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX+uBKt207/kSD
 HLP9lGHKTVLYpdaeNLomfymundv7af7170GMk4CXfzxi4h8rGJco7LweIQ8vPxQDDqc/lUsPAVa
 BsG9tBy/x3lb/XzZAvCPWediOILZRO16q1BTjaR9kzUCdBcBFWx1rJ5d6hSwVM/xxdiMUJGOI8y
 E+gD60Sg0quGkRRD4/Cfdo5FBatDpaQgkb763vyyK8KdzeIS+EfnWeMAnOU48zdl7sYQqU0BlN8
 y8dJuLy7m8ZhlPe3tRY3NrEMGptKYapW2K/qGL+H19F4CONlKPIsB2tQqhk/8PXMfF8dwmIV1V6
 Kiu96DtufB8ErrReb5e/wTtHBr7JjOhaExS9vv2xkQDEpwc7RsdAMtEJvWIU79aKN5X1vNgKQmC
 MkToM6S1bJTFb1voUUTTD1eNKOUFVztIGAVeE3OAMkoCh2F5ZUVDZVopiiCmRr7/YFAwqucNAbj
 6E+0LWRvtnOk4nMxqcA==
X-Proofpoint-ORIG-GUID: KndKwy5Cuy4L4eyQHgCOYAJrvqJ5TW5r
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694c09ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=3DtPeeBlMjcqd2FmxTYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: KndKwy5Cuy4L4eyQHgCOYAJrvqJ5TW5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240138
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

DPU units before 4.x don't have a separate CTL_START IRQ to mark the
begin of the data transfer. In such a case, wait for the frame transfer
to complete rather than trying to wait for the CTL_START interrupt (and
obviously hitting the timeout).

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..4faed35f146b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+	if (!phys_enc->irq[INTR_IDX_CTL_START] ||
+	    phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);

-- 
2.47.3

