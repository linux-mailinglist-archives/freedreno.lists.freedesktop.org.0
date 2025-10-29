Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7898C178BE
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 01:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E71410E6C4;
	Wed, 29 Oct 2025 00:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b60cyLLn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3ObrnFl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE90F10E6C1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlUes2525419
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=; b=b60cyLLnGPIYVqY1
 y1eCbNRllbHQeqtZHhtrK38EbhJym4H3A2ltPD2NfqkktHucHZNlxli8Yo6YJZiG
 7z8vGY8DT7uwZdv9ejfy/B+ng13/Fw4XwVHq3RLhoZL1AKaipqzHWICk5ZoWLFt9
 17Ylf+gC3xnu5DPPTCEBj5XgNtORiUaiq5vDTzUWUlniATBjR7nwZolJ1Xu0oSGb
 yOqCnlxjzZL7hdge4liWmflOYiCtAypGzspZyTGYgw62oBQJ3nFjq1Eq3NgHWHRT
 pquXlVLSLDxNrv2yaxBIJ7VmiKCqDvAoDrC+r4wbX+3iTPf6mHi/Bsoj9FfD68zT
 UPBkXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rn3a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87c1558a74aso255867036d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761697847; x=1762302647;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=;
 b=I3ObrnFlUK1xexVzQ+3KH53VMp6PtP7MD2PCZOILCZnPf2PtSqQfvpc0iMNowMsPcw
 qu1SMcCh4m2msdWRReyLVq8BwCuzf1p4/OdA3B3DP6kfo7XGQNGhSlSJQWPAqURFuEKF
 rqhlt9FkfMJhKDZ+5YSAj0qwNeDoRJt8QGdILCznYLeoDu7+84egKWvXcCEVMhI8z/Tp
 rXsnQmFq+DXNjPpkQy6P53xk/2s7H+DX7yO/nBiALPNqEdxyKQNKSxU4JfSo7OGkmWdJ
 lgyu2AEm9H3pbw/pEmtlE3cozIbroKsGEpSyLtjCDpOKR2MHet6Sn44LOvrLQdmfZDTW
 zSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761697847; x=1762302647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=;
 b=NBtxBUPsMmeMyE3CDW5ZFJgRRM/8xayce/+9hCleW3g0RvcYy3dxaDQmXRFRrVbF1s
 LqQ1czhD1smctXJ1MmC6XR0nzxI89VuGsqyMw2HmBBwtjYIkXioO7AVAmmFadxZCoLku
 3wVXNJxi6mEhL4Nr0OZW+cvsY+yY1u5ieqYf+3wr/BMup6PoAarxrWOIX9Bf+S9IfAbI
 zO9EPoH7U3tJseaIVQWbmK8kajogs4MVBYxMvTg7HVLM0DZppx8fT5vedxo0sU9htfzQ
 HzPmps3HksLqE7KC8wKdBRC4mPyQz19fhgLLCsgGMJnLhDn95FqikrHzaumXFMoVb2KO
 W+IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyJyf93kfEFgFaIhg5ovTxiULsQt6p3aBBiPeiG3yHGoCT7SRTkfFwKoWYh0o0kEspLTLKp31hpGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv2p3Mzym8JvZSl+CvYfm4K9Ktnkumpjvou7fTqluI8kyQsBvK
 FPGqQMnaLfYSz8obUDecon5301pAf4tv2HXwwUhIKRHrE0cqBSO9rtRXJPbKChuqY6FjkpoF4om
 euyYU2wdnat6ZtQxi+7lmwnquqA0pKC+Z+jcp3pK0/nQC9cGSgjKk11/+o25yhIWse0MhH2Y=
X-Gm-Gg: ASbGnctDC8QAS7Yjzdv/JsHiE9rgqEtXttHAaW+6OE4UN0Mztbc7iKRRJgVnpoCxa/t
 iepn6gcqlea5RMCsyt2V90LLP5MLfU4ijoQyl4qLHpdnCEV92yAb6cdwtqGMe6TzlvNtNK3VqaT
 WxpongB5SMqV6HSASluLx0e5cWm3HG3a5SwWacJ2++5WLORWynf314Trpsjy54lPpQUYxpUH2t+
 1aioXaLlRT+Hqys7h7fK0T5Dng2p8U63FCmqdzn1s+uJYktEqVsSSpwMoPeqf+tPxouWD5Altjm
 I6MNuXJX216NzPcQoFTkne4WQhlrH/peU/zOMh4lJ4axsRhb8LyQrjwywrBmslhP3H4o2QKABaU
 yb6ymAlpgd7DxJXRIFSYTs1OB0tji+Z8i92v6zlePHeZHireGo1ck4cyLQSwy+yWEnruBydE95a
 zNU3/8VIf4l5sL
X-Received: by 2002:a05:6214:acc:b0:87c:1e27:f7b4 with SMTP id
 6a1803df08f44-88009c3fb27mr16408746d6.67.1761697846818; 
 Tue, 28 Oct 2025 17:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsBFnqbz/J7aBH99rrrrpjG36zD/8B0hEGORviQ9ZerRyWHsasvUR2RCXFVhnR2eDLiEUJxw==
X-Received: by 2002:a05:6214:acc:b0:87c:1e27:f7b4 with SMTP id
 6a1803df08f44-88009c3fb27mr16408416d6.67.1761697846330; 
 Tue, 28 Oct 2025 17:30:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 17:30:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Date: Wed, 29 Oct 2025 02:30:41 +0200
Message-ID: <176169780818.3761968.15179413078088034823.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lTpyK9tYjr1EcdckxVoFeZfteC57simb
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69016038 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=1bp3yVi2_WrJ7BMISZwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfXyoeUHku39NJm
 QkQ/UL9jTcdxRf55p1JPeoIqWuRFkZPsi4EsjuEIbxCmqUj51jKBYdrr66x7pTDxuF8RXlPOb0G
 mXriHKq8VQa4kMHkn7AKbL0gQ2p1ToDUuNatXLQjDvywwgVQHNsVA/TG5B73j21T7T9tNCXYwhT
 Eh/OgbeFDAyJfhJte7vldr8Amqe3Sn0amN5yQnnlt7vB+BA06JVCIT6/sHvJVKc80xmjCZeWSlf
 Nr8yxGyo0ZrORPl2MWKCL6ikVwD/3ct9w69L4HaJ4owPAiqU8WA8wT66BBZZrtsHw3RvgC/+4B0
 pHao+Fb3RFnT6ceOrwuuZPataArlon+ookDtOert27y85tSqrv+kC/RDMOlsaZ3+0vcgVpvsqiQ
 EAt/+4KkYKNyCo/MH4vhzGSmxTm/dA==
X-Proofpoint-GUID: lTpyK9tYjr1EcdckxVoFeZfteC57simb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
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


On Tue, 23 Sep 2025 16:03:50 -0700, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5d079564c44

Best regards,
-- 
With best wishes
Dmitry

