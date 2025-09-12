Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30AB54B2F
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BC810EC18;
	Fri, 12 Sep 2025 11:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI5F8IAa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA7410E1AD
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNeV023224
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PykDANlSk4R6a44QfGxuU2
 LMLVLao9uUaS064vEz4Rw=; b=CI5F8IAaL22LIdgNCh3lgNbXuHEmEpZaJXQnch
 vBiVaHRyO2gUOQGShiQUNnMZq4NdDrgTH/rpLi+ld1luFBxQ2IgoimrrbsEipct6
 KXu7AUVD1F8smoYOLPSEXJcYEYsG//E4OP2+5oBuHYnikikwLzuOM4fqLr6utxCB
 rdKYWOscNN943Npbxid8X1WV5+3neX39cQkGWOPSujNG2E7VRJLefrQ7yx+WseWq
 FDzCnkb2X8wclmNwEC/0QX91ArRRT6irbgqZW4el9eU8v2MsCOoMXptNGhsx536e
 m52cj1dw1EZTAVxswKZA0tR1ejDLVvuY0y+Np95Gv09b3A4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fkfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3253ba05aa7so403183a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677179; x=1758281979;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PykDANlSk4R6a44QfGxuU2LMLVLao9uUaS064vEz4Rw=;
 b=iTINL3e5A8MpUjY8ysy3QE3vwA955OYa+1ebEMmdEUD6ziQkfusGYR3E5cHgwOJwSE
 tCulpddKfQ/QuSC8cSzaullxRM1AFDGRgXzrIhpzOq1/HuXsJ3auF91+iC/BUE+9JEzt
 AEpUhYFIlMxXKLO0x1ByvjZJE2QtE+SScc6DK+l4k5K2pqHCSHFN3wNZVOuofM5fKip5
 zwcEP0GGxgnymCK1vwTFdBqUnq8uimKTpbfmibwWZR7zW1zAD5lChYZXcTxQ68iPd3J8
 G42hgDwWUAOfrddvcJiaYPVH+IcSaDYVF874NdcryxPHdzvkJFAcmtZdACUpGZjLd923
 IoBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqYhgRUyKEJIFJQiePfvhGoxppMrDDGloiS2xOE6ChzW8wRHzLzVKk3Fc6o9us3ae/QdycwPHY8kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgVu+6FwIXTX81fU3j4NDP7nqmfsj4dvp3v++eMqfTdcSAKEyL
 k0Ov0AtWW2xEbg2UBl7dU56CMyTbgnnEkfQU/db+HkErn/6IvvfFjr/1GDf30wUVvqtnaX3v7qK
 4c1eHKqph0f59urAObQR+rLqxTPyCvvv1zwMNuvYnLzhNMHTWF+rDN1ScrQn3AZzi00sRkOo=
X-Gm-Gg: ASbGncupIQFG1rkaLRXoYECBA7eh4MRZFgc+GThZO3zmlK9b294Fylkjp/+Y0z3lRhA
 fMbQ7NQBzfxS2oKFvan66ElN0lb1SSgaZPTv9wZyhuhHl3890J+8Se+c9qNunOOSLJ8C+z+8tlf
 /zLZAO7rz6kH24/VjQRh4H3pAm0bsMzodTE5N7X0cVm6jUUIhAUuuJl9rciFGJJI9/23usd1AXt
 0GrkHj83Z8rn/S0d900oMTMz/vVti9OrVOoHgCbzSNn/1qI5W6oRe0QS4w5yZwKbUnXzxCvcbqx
 9vDqIHIaCFGf4ZFadtuKHX9h6x2murey4gtcUL+7KVrUnUXCDpsi0N+IcmZV3m1grr9sx3FHxgJ
 L9PenI5tjAIaChtbmhWGMhbFsovBqFx56J6UKXFbJ8QjNb5Mzu8MyHYP4
X-Received: by 2002:a17:90b:1b08:b0:329:df65:de88 with SMTP id
 98e67ed59e1d1-32de4fad5c1mr1619903a91.7.1757677178537; 
 Fri, 12 Sep 2025 04:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb9/qfSDeeJM4k/mSV2bhoe+sAdxJ9belpgwJvZWL3AiibRSUg3vhUglLK/FGes1kYgelegw==
X-Received: by 2002:a17:90b:1b08:b0:329:df65:de88 with SMTP id
 98e67ed59e1d1-32de4fad5c1mr1619868a91.7.1757677177899; 
 Fri, 12 Sep 2025 04:39:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:39:37 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH 0/2] Add dp-controller support for sm6150
Date: Fri, 12 Sep 2025 19:39:15 +0800
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQGxGgC/x2NQQrCQAwAv1JyNpBdaUW/Ih5qk62BulmyVYTSv
 7v0NnOZ2aCKq1S4dRu4fLWq5Sbh1MH0GvMsqNwcIsWeriHiyIxccLK8ui2LONZPKeYrJmv8HkJ
 PyBd+0pmJhpigpYpL0t+xuT/2/Q9oQhOjdgAAAA==
X-Change-ID: 20250912-add-dp-controller-support-for-sm6150-d7db03d0062f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677171; l=865;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=jJaKwtw9u/RInTyEr63Le7/5O1dlIWRXoH3wFolu9pM=;
 b=GqiLToS8NHqUmFLqN3uA43qTSnAHpwgK8phMB7Q2jeQrhHoIR1sFeeVkcrDx4h37tHXsnWmsE
 dg80WW/3tZWBxK+84WBbYMpFH2B6DOuQ5GFLMgjc3pyxKybCSJ2UhoV
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c4067c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jAdeW1IC_iKJYOCu1UcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XkUk8Z3HLIYywOpDMZUuIX1OwuHIhWOc
X-Proofpoint-GUID: XkUk8Z3HLIYywOpDMZUuIX1OwuHIhWOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX0Oa+SBP2//o/
 TpWAAmHMd927/0xRbeLQ/+T/MxBFlhB7Ua8dwk+xvr5wy/+BhzBYxsVTKMJxZDWhezZMSTnmSIr
 InQLgIg3pNvhmygVk+TBc5BQSARRiT0Llh9O/73Nr0u1keGjhRqcGPVzXme6Kui7KCy2GWougAD
 jW4p7w9r7BqcQsEwOMjwDzXmqbKJWskveHC5yWg9p25LXxrVy5ftk8NEjHK0Wnl6TleBROb5dAz
 xpOObUHUtOT/2KkRkZnjUa+XGBKiyNaUNxABWGXFrf+Db8XWc4FwVwcZJ6YNu3qzL262OkEzjnV
 qqQeZb9i3P6TAZgU3gX5G327dl0Z5veUhcJU9h4rY8qWJyu88alRV+Ml6Ra28SJx0VOdkHpXjrw
 luycGQoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

This series splits the SM6150 dp-controller definition from the
'[v3] Add DisplayPort support for QCS615 platform' series and rebases
'dt-bindings: msm/dp: Add support for 4 pixel streams'.

The devicetree modification for DisplayPort on SM6150 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Xiangxu Yin (2):
      dt-bindings: display/msm: dp-controller: Add SM6150
      drm/msm/dp: Add DisplayPort support for SM6150

 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
 drivers/gpu/drm/msm/dp/dp_display.c                              | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-add-dp-controller-support-for-sm6150-d7db03d0062f

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

