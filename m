Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF2BABBBAC
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F9C10E3DE;
	Mon, 19 May 2025 10:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNGSjDL9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2C110E3CE
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:59:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9IRGc025244
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=TNGSjDL9I6qUy5yj
 PILjBTcQS3UphGkH/QHoFaeAmcCcH91T9l/iGOddVRHp7MYwUG2KptKfg2b5qOma
 AzX30jHkwtB5S0vTNH95gt7hwMV3HQtze1b3HnkWj/VYG1IDZQF+RJYMg7U6WHkr
 sav1vZBqsCetCrTTyunwrZVj1Wl/IUD4QrQM/96knE5aKp/C1xh2+1p5HbvSY+yT
 +fuAY0YgjxPd2Uvpn8cAf9uSABbqvwfX4I8PnE6eEaCMhPWkges4EXaWbsp9hlTB
 9OhTmCFMdq8HfcLentyTLjFtdUOnWpanrZkVLKnJ4sePmS+0TS8lY/8o2kqb1/Ys
 Mu6qXg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8d0c8e917so10371186d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652338; x=1748257138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
 b=tLsTbxOQr/Vsa4BEipf1bgF+WJ3ZBVBvjNDPVn/HUEi40LKREeoKnoZXoiBWGs4i1f
 yOjHH8Gzw7QiTuYiMHm6xVL525Tv9B94wrdON7EVp9QzOwX5xCp7eCp0Uh4BJnYSjLS8
 kyq4ULJssQSTNxCW5Zis+hSWfjTeZ21rHVs8w4+g0ogIxrJv7HotobKw44hsdKmbTlqI
 TXc+kGBlMLjKWVkzc/iKIDLhxA2G8DTpnWBJCWqOsr2Y3fmIyJXC2OEJ/drBslWFkJR8
 vtQBWOd9TcRP84W1TF9b1M0AVh8Qtpm42fcZtxpGWs5BrgLFZIXbu42I/fJqxo0Xu5AK
 q9vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUePs0Cwxp1ZWttUZ9q7f3giH2MVzDilKcWTxneUtwjaOL6Z33bcU+KapJ0AMZgpFaxVw9YSV4+a/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/kmlf4Fk4MIDMjRVMNX+mSf/LQl7GU1pDk5RChIbgwiBjmpGD
 kHqQgz+TgXnqzeBP+aHzCcAh2heO5CfT+hz1dPpPodOK/FwRmAetiPV2FPUE3/+KmZOOWEEJbOq
 mCSM1nWrbFdm/0sYnze0FoYP+rsMzv+6MXz+Tmvm/DKJ4mpEWKGXcOmygNQlcIOGAD/VzRcc=
X-Gm-Gg: ASbGnct8snbrdecL4+Ig0IIRDbAa9sj0ujbnbNSifE8ns6owvx7G16ELfbrdPpqeH45
 lnGgweFcxRkItuAx9qAOZLSplIQN9X6PqXpDnizTFuth4IBAmmpAT9n+hnKt7tMlyQQ80aGaNDH
 jB5qqdd/AN+agH9JSd80k0bl/YH4bwsQMajT2az5oW3PD8lyl+rpZwGDE91HMSdRM9Lh/8qIlVF
 L8H2DlBt8VHArOiX7i4yO1JPOcK39f7XxmXty0VVPnW+Alzym6WCVU6WD2j3Ffol3LnfVO5D9YN
 qzK1tT2FiAIPgjxqNu6jCOTKfJ8kmDKzRzUaSrG4WECwmQrDUfoltT09sIqclix+Zhrns1qCV4N
 ov2egAeDJS7R/dl5RVVxeBX2Z
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id
 6a1803df08f44-6f8b096db83mr202681086d6.45.1747652338528; 
 Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9+e0xodbssXAPktkA1sHSaU+L3EdyNKhog5olMLiulrlaQky3UDZDMD0M0rpu0Ed//Cc6bQ==
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id
 6a1803df08f44-6f8b096db83mr202680816d6.45.1747652338140; 
 Mon, 19 May 2025 03:58:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Mon, 19 May 2025 13:58:40 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX1GBqzjfO8bez
 r2rc++1OipHDRMcdSXIoY33wRv2Q+Vvu2u5ub3NkhIwx6nU7CFtQk6T7tcIHEHb2AmTaIrmS8oH
 lFsWrrtgYgCQAa2KWtiCQqWsINmCyMK2Hf0caqwcFd3cB1gnuGY6rmSNsLFkQbkLseVAix7DyxO
 mBJuQEokRlOaiHkv1fTLYxCnda9IfWT2wv2eyj4hM6Rwqw0hQRM+c0LVd0GLBl+Z5fHYBvq/9LO
 oOKfPHpEiuclMMYriTr+IEvaEHRzSNa/ISNe0EK7VpQhdx/NrT7x7+gmj3tWJcvMltayvJyZjdB
 32XqQUa6bMbLUADkupZvNZC5CZLJN87beItfRS+GTmY137GxBp0DS4tRtLAjtw9U7wb2okqQavf
 Tq3+w63tIbHIDWZeTMqncgF+wuTQtbSsnrKJvw+sLLvOQdFdqJ7psdj8KTEoYpqDnzKNPN1v
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0ef3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: LtFVzEe57BZHNm8imd5vbFGTgB4Lvhg5
X-Proofpoint-ORIG-GUID: LtFVzEe57BZHNm8imd5vbFGTgB4Lvhg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=825 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
