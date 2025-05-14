Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEDBAB758E
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AC910E064;
	Wed, 14 May 2025 19:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWhQUa+V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A949210E064
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJCdI4003052
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CSXJafEBndEZ4eDNGwf9CSLO
 amluuCqjk3lNWaZUCTs=; b=XWhQUa+V6rN2CsgxftM/tNuwyqZIhh8kyre0Sm98
 fmFSfoT33+sOOKx2N1rtffKE450g9zKSMuezD3zxgx9vFLHlUVzwsbR40vxb6CFX
 vXWyEVBhbwIQkVhMmEhjsLFZ2V84ru3hR6v2Wx4Cmx3fOAoOPusOT6mU1r5GwfM9
 3FNRyCQggbDrFHRtbJK5/Tgzz58H7T+j8IMFrgKQx3yIQ4svKaamvPptHW6tYSg/
 YDYxuHqaXYmeoJoexQVRi5cl7uDntwhiyO3MebE47dcw1GpL5FfQevN7oAEhzCyn
 0hMoBRue/7NUAGNZHfHp+jsK6hOIdS+SEm1DdBefDvKgdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrbsjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:15:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so11072785a.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250156; x=1747854956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSXJafEBndEZ4eDNGwf9CSLOamluuCqjk3lNWaZUCTs=;
 b=UocMAlryxICWWHb5AnmEJPfZvgQx5fqfPhhzdaDpvMKAfLpKjoE9zUr7uc6vPcrogg
 7ht7pkTY4s3Q15ywwj6XqpWam2NmlP7mlE8kC2kyid0Q6GYUtUe5ukY1erLmL1o2ME2S
 +Y4QjUiStMfdkIU8zrECpAp+tabkyzS/FeuviDVXmpPzwjXxO//RsF+SlU6b1211Go+f
 meXbNI1Lib4UHNhKUXDeJIeKnx7IUVFqeZeWfYpNR/XD+4Ybkgr3my9HdI7+nsAPrDwQ
 nojtFCGpgDOS9VGMG4erHFyC4Z0066bluF+tiWgpLPA3aatPog7912Rtgzcv0VSQcQPL
 V1ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5Yu6x4e4gIOGi3bse8mufeWd46G4tO8dcqLbrexhpuVVOFt7z8+s9WVn8HnZMR0zSGHzXccDhtaQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhC+YahxTdvgGku+co3SO3+WxnofKWwcgw/PMVYknVRorxPf7B
 i0VzK6MH7j8RLlsDCGJxejJv97jhUSdNlYl82g0H1iWIy7rcNKgNsUmjmK0ZuTqAN8dzdKXkahg
 7+sFkfT2/i8ac7AGhJKB+PR3BsZdn7f+2u2yJWWFhQgXge813eUaFBWbAYR8L68d8ruo=
X-Gm-Gg: ASbGncvmAaPme7sWloP8wU0eXLd2sSLNaRm+cDWP9Jh+W0z3iUZd0bKlLPw7OyXsIcs
 cUjvr4oKciQBGPON4UgtaVIUsZ/AypC7oM6W6b9AYUHSHZhPwLezbMkiYwDIuT4mAhr/jQWfwtq
 V/I6ZdTVRN9lmdTMNEbLQj1EEMQWJZUJqsew6wnhsJC1V9uhtidHFr+CLyz8bTJ9VnFg3U+uEZj
 SQRZZopqEyO73PptFAt6Xy47zbxOsd+NQBwM4QbV+kE/ql6SCoK7xT2Vzy3xmszg1w6GM/UHjwi
 8KVImIRAgXI5GwvfBZQVCkOFRbqXIf0pbmHfFvXWedeYcHwU5DiYLGTw/bvE6QLJx/EVLJiJskk
 =
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id
 af79cd13be357-7cd287f8f48mr580084385a.4.1747250155800; 
 Wed, 14 May 2025 12:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+lsR3EGAqk/P0sGN2G8T8thDbUtAJQH3vvzCa+2jovpUXOQ2pgDytWPOHkOaAfe49pPOW3A==
X-Received: by 2002:a05:620a:191a:b0:7c5:49ee:86aa with SMTP id
 af79cd13be357-7cd287f8f48mr580080185a.4.1747250155227; 
 Wed, 14 May 2025 12:15:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64ccb9csm2355737e87.234.2025.05.14.12.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:15:54 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:52 +0300
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
Subject: Re: [PATCH RFT v2 09/15] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <3btixgw42sg6qm63znc46msxeyzvutitokb6zxbxwftxyyuyw3@22rlivbf4gvn>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-9-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dDKxMJz_rxh-0VYHQ1y2_XFzPyefIE-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX3a50Cdv3xWrB
 jqVp9BbBJs9VzsGlwex/HIGyhDVtS9V16COLAdNEVGbUzcaT4B6wiWXWRT9Ea+SMbTdxXC/8Jvn
 1/K3SjV2bxzFPKGOmu3kWV+Tdo/YDCX3VNvA1f+1VWvD/l2v+q0ZQFW/3PU1PWAfTlXkUg01IYJ
 rFftzTDGm28Ij3p4BVtxEkoHH3k5A8x50oPmSqlB/34hX358yRE2UeUtoNImxpCvwN7rxsCxPu1
 fdwqlvAH6LIDtHyPYFKBfZOd80862O6vRvXxIXXGaD/tmmFVOtt1c4EO0MVIwPtPwhEmjgG646S
 F4fWtA5aiI6I7wLcXxuFbffhV4oHfHa4hh5pn8QVBcrNABw67euhSiN4x+Xs5z2nJ/pek9qxX0y
 CYSuxPqRRMiMTNnGSSKXx4q5g62SpiRzdqhLziHxgNSbtOeC5yqe8tcAU1EN0WNNZG19Op9w
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824ebec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dDKxMJz_rxh-0VYHQ1y2_XFzPyefIE-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=793 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174
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

On Wed, May 14, 2025 at 05:10:29PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
