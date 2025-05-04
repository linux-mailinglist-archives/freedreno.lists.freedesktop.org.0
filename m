Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56290AA87B1
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4706E10E0FC;
	Sun,  4 May 2025 16:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYY5Lk3e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078E110E0DB
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5448UPJs016280
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=mYY5Lk3ek8ARjW36
 ya8vLcViA5oGGfbflO8GqSaijdgywhA/EQTzHOUFPRDpjrhxCxfZDkt4HtqOQhan
 SqyB5dVuRVxw2Omtl/YX2bj2RB0X80D2/f6erMatdmoR5Mb6K/53Evyrf8XUY9qw
 rm+/a5Kp2OhZGEuZqNBIKp3qhEfhMMpEIQtetFVCXJYDpyHuU7tyEXj7B4olof5q
 BmlQqXjfSCF4zlPTz0RYva+HvcOOuVffDe1F8vGZ5M5yWVMKil1ylhQvlKyHOVk3
 lNOaQ9woRITIddiQ8r99fnzQi3VNB/WDzTcOc6uVOfTNYUGv1AkST4Vzzt5+7qIQ
 K2J/Kw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt9aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47699e92ab0so78132961cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375219; x=1746980019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
 b=N9zypflTkMbamNr8Nh1nOKm0gVBmVB+RG8j3DfH4420as/63Xmoqe3BbVeim3pkAHi
 sGn3DzM1GermymE5hEODhqfFb+b+vEC9iVXoi7Eb6lAw4aZdzY/+hPX9EUhZmIqwvWK5
 qIwThufxwORFAJJDOMoGA9NcvZGsCY/Wy7aGOVmkywjTeG/ZnnElSzavESYRN7YJhXeS
 t0Nsp8KZJIzzWPWLnMHAUcRiiCiRHnsj5ocbfxO0u4ye08kSFCKmEVUMTC4xqpPnlI9n
 kxBjbLUrw/OQlCCHJpBREeYpHZFNd9gIVfivWTef40ZO7QHop0e/rpFWkIRtACLAo+is
 QVuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyyn4oz/bOQDv+71r2SXPuWT/7rXztc5aMCflcm0o8gponDccvgZdOZ5dYC+PpsJ8AItX9go+QEOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2Ud5SKuSPCnV8xtxLkwbPfyWi4F49Wkv9G2ZViUw9NPW/8cGB
 KAHpKKdHsksHonQgjCWo3OT3cazeqvbxnNxLVceSRHN+f9XajGxgNiplh9jVB7qL/EYcmU1782S
 GXL7aH2k5ys1dj4Q0mQ1dH+8Amdqgr2fPsGxC0C1m6e7/83QLWDGjsSO6iXKHf+3rnbI=
X-Gm-Gg: ASbGncuqaeyK6EY+rhAV1gQVYTxc/AQgvq8Cp/Mlm8UZmk4VME18eSsd0ERfn8ZctIy
 wsxt9TCytVaHjPyaxVCN7OJYoiv5IJ/GiPyfpXuhc2HUbT5LowfMohD0Yjm5HsPXXpzQjluRl3C
 qYeoTFyjhusdP6K3vFhvk8an7BE1oGAznhQPGHq4vtoBBX3kHytrsJqaWvBz8lCp78urOrL24OF
 y5VEH69qkT+4t3wRcAWA6W9Kz3FuQDO6T17prNBMTM+ySJimvakXqeNfOHd4rHBTbIO4Qu5U2r9
 1OPTCvr36xDxtUt9GvsKsrovVWUwgq41Q9O2Nrt6vyn0SmAs0pvh2M1Rmz88hBsNu5oWvvW5kcO
 XuosNOrjw7Fj7GhwUknudPlQW
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id
 d75a77b69052e-48dff9dd1eamr62916561cf.21.1746375219172; 
 Sun, 04 May 2025 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4PpjTVXPh6t2ptCuDJ0u61ftt8JaFdmA2iRccvAqFCJVOcO9pPmlvh7PN0itVonAKVAxATg==
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id
 d75a77b69052e-48dff9dd1eamr62916281cf.21.1746375218850; 
 Sun, 04 May 2025 09:13:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Sun,  4 May 2025 19:13:22 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXzpdg45sFyDXY
 BNXniPq+nofFvsDP936SJox3mjASDGZ9kP4yxG6alvUdz3egEeXwkdTkXSKWqX+51YW0gnSoFSG
 R8NcEh9o69b6Qt8kFa8U/cOnciA7rvDxFH15sS4nOIkf9Iqoo07+Ef+E2lSwAGEX3eWcBfh+75F
 zrc0JARlvRaZuRpyENZS8JszAsrYuCcNyAXavn9Iyo8eDB67izxSizi7zELHG2M2zcq53mhusNd
 0uLp0c3UyycaySOTwG8wI+wDBWg7kAswMaMjHelL2U7joMbC8xWERl/aVEFMX0vUGiZxWEbcMU2
 RJJ7jVenkzIAD8iTYqFzjaRnFDZrDefvMKJ2DC2P+Oczvhuy758m5JHVEzNWoYGEFgwEw9yH6Mm
 9oooVmHV4g9ScGtbskRdjTjp0fIXYWN4WwfxoXCYAU6xkfnkOqIq0kUUd5iJsNg7qOhXjhuA
X-Proofpoint-GUID: rcqDUwupYyePpgosXgX-y1wmuNwKZvv1
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68179234 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: rcqDUwupYyePpgosXgX-y1wmuNwKZvv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=650 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
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


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
