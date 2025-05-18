Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06DABAEB0
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 10:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B97789A88;
	Sun, 18 May 2025 08:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6HQGQUh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7AB89A88
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 08:08:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5epVc025949
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 08:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wmWqtYSiIFN8TosqyDerhHbb
 O2ZOhkYbAGNp4xpMYiY=; b=C6HQGQUhpXc8KLqtA1l9WP/2uGyK7EJk7lv1rd0N
 EQkn6vk5w0uCA78Pq7uzx474JdTOB8p4OlWmSldjVnOOU3OZCYASyaTxihBxArtv
 N050OZJX9XvpjH2Dhtn1PyIClIkwFwWokPqnmLjsJfWPuhzRrE0eAfdT6BS2MKOL
 n270SXmG3K19GEGIJNtZfPPPCzjzucDYtMNo2HN/XqS7Bc3PCkwB1WVCnoeTG+7g
 OMYotGt9Vch9NOyoDE2egQHJQazTKdAsqW8srx1HZK7aCsR68YCH8SOfyyoowWuK
 4ibcx/vRKNYnEQcxLCFQ0APf/fE+Gy4o6xIfplLjNl2VwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9mme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 08:08:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caee990715so1014846785a.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 01:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747555700; x=1748160500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmWqtYSiIFN8TosqyDerhHbbO2ZOhkYbAGNp4xpMYiY=;
 b=PtCt+804fGZGPTPHZ6Novf+jeezrQqbinrIlZqLUGgW8+poZSDDfVCQbYnJBH0joTv
 tBFRn81ECmxx/9jJjkvkbO2ECHcnOm0pUKZj5zNbpsbK1SYT/ddK+7+lgqjr/DpEMQBT
 MgBTfg5w/8zZBJIXyBmY+Vjh3j6QzK6gWwth2s4Rs3B1ACc1gGbh0qW6V9/uiC/y7StY
 Qw/j9yJ2m9BChRMfdBDzjVHRi8Vq2ohwKt+VIsy6GkcjD6U/bBW6pk0fMtY9vfvxsMzI
 jK37gRkhD2VRpJDqY3caOzUX2fq74o1HUxo2iZX7OIhPq30CReKVVTx15KaHtGrtNLM3
 SWEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF4pFjR+jmZWqMCzQzHwmB5QBBClv0ZsQWIRojT2o/epTaNipzm1irbiUKRwYov7xQjNF4TyOBbcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4vMcKkvI5AoClhKXKG+WoAX0ZZR2TC7Jj376lbxbpGsQBT8Or
 DvAZbRAotPVpxrDTyUUGqXKth1QGjMJ16/knAUquKpW7ah+XHGKEss4s4CgLatgS3JA44xtOfpC
 FtJdz9l6Z1uiYXTuLHk1hP8WvKH1I1hQeoBWDw0/THCeuz6Z8TWIacZjou3FTG14FLqGbslg=
X-Gm-Gg: ASbGnct5WIKqVENIQpr3tK8SoXI82VvbJ7bPZVMhEuPpi95avHaAq8OHq8I1LTZ7aTu
 YglzrjwSCC/C3Kq2G4jzUknT2R/cwY0MXmL92IviaQrqSk9MBJ59Cf/n0S5TiORCTfvMqtCqCoO
 XRjuDx8dwPFcGJi3Hs2TgcGXUTi+/J3Py9kWllIqKpG+5lRRhYcsDR/yJcIKzN5v0nOmrvpt46B
 qI+GAbujWdVIzJfpEq5hPojajSw9HQNiZmQ6L5oUP99ZTalMl0nRSD5VNZ28AM8MciToWqp7vJb
 Fd7xB1gu1xfiSK2RunEVdLJgEnQwfupOOwXaRLVqdZcta9e67CRtyEmywXUpc+QgGMdQCwIUpWQ
 =
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id
 af79cd13be357-7cd4672dbd2mr1169449385a.20.1747555699838; 
 Sun, 18 May 2025 01:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpEy+h/hpndRg9Hlf+YjYTRJuStQXJvvaWu5c4pVbmVGiqNrKl8iWNu/IBEEtYb6kfTo7iZg==
X-Received: by 2002:a05:620a:4015:b0:7c7:c772:7442 with SMTP id
 af79cd13be357-7cd4672dbd2mr1169448185a.20.1747555699497; 
 Sun, 18 May 2025 01:08:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f15fc6sm1334178e87.29.2025.05.18.01.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 01:08:18 -0700 (PDT)
Date: Sun, 18 May 2025 11:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 02/14] drm/msm: Offset MDSS HBB value by 13
Message-ID: <5ixkozv3krh7z7ebebunx5afbvuv3qr62p33ycbtt7zsoahshc@6go6plbcwaa4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-2-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3NSBTYWx0ZWRfXxW81wX9uGQiE
 xC6lOeJt3ZR5l3lKisjsML7qbujhqOeP3ZErjDFVmBZCo/SGWrzzMMFQeKrPNqll3s2KxbQN4QT
 H5fpEhKfxGVBRvs/rEkdBpwe9+Y0u8NI6dbrDCxsThBaKf2LB4TZb5vSwzIYLhVSbNLAg+MjGij
 uBgQGbsdkyJ3TwmencgVQVMIiAgi4hpUws1YcXmNSlW2kGKMoxp7yWZOlV/UgISaphydifvE3Rs
 KcDkyvLv0rPr1MrPtU9PF9T7ThgytK+lmABZ27IH5f40ONa7T//Q9rJybWYMJO65ICfuYVXnBNM
 fG/rwaY08+UEmpEJzIMg8UrYwLsjK4USV2N2HcgYa5xOn4pLt0A7D8+yAFqOKl16FqJQZ9RyOB8
 vkds4YKprvjJX/kzHDNBB6B8G0GW5m/meIKY2rzSqZW+KelSVtQJd9tmRzta5lDsnCD9T03i
X-Proofpoint-ORIG-GUID: WSLfcF0xwPE2ieDzM8BkJeS7A-KoK5ZO
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=68299575 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WSLfcF0xwPE2ieDzM8BkJeS7A-KoK5ZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=793 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180075
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

On Sat, May 17, 2025 at 07:32:36PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
