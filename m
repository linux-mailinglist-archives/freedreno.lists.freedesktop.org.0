Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16DAD3888
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 15:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FB910E54D;
	Tue, 10 Jun 2025 13:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx0NUSpL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92710E555
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 13:14:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Ed1g018492
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 13:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g6IwQRxCUScwxoqS0e4XHRFL
 lV7pUybK/kFVnN3gEOo=; b=Qx0NUSpLbFRnnJwDivnuJ8s4sTgo/boEDUuXyXQO
 Hi3V1oGCKilWewi9Kvax9DwsZZrjE/iDYqJokwD8VleptqpE8QTEeJAMJa7qiwNO
 TAoL83Y08TAcNzd7J8zkiSHVT5PD2oWVUpFK0uF09lldeLvhVdab1RqQn5M87ASE
 T4gxcUO4jZ1lORlFqVaJDBPpkiGYFLSIvKwQjte9AZ4/rctHDy/JwvBuCNBfoic4
 IoBMBOeFPainOeALttPyrefHeGXPcwAe/N7ekcfS7VxFb1WAyGc69bG1KLlVmZaJ
 kRGzGhbIme2+B1E6KVlmNYC0trNKTGBx7ZuW0iSenhvonA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcj995-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 13:14:38 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-70e86a2a1b8so78953437b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561277; x=1750166077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6IwQRxCUScwxoqS0e4XHRFLlV7pUybK/kFVnN3gEOo=;
 b=BEmoi0DUm+Enxp+7Ad7EwLjLJGD3Ki/zseqawI5e0BLAecIxtq12zztmZg3TJj6Y52
 MYOR+eypgI+14ED11KSDTBqb7UXZzOybpFxmw5CAkaZQ+jvQZgigw49DJP+IKfwL07uq
 vPcnlfjBugudUOmoV2rnGbymXHkxNIdWwGcv1PwNL2v1kr+6OjnrS+OMx2n2jyhI+5oz
 sX/AEraHpOXFclBSfLdXtSsBsBSZeAsnb9w5QtkEp7b3gp7ckYgkZ6nCiU9sWuoebera
 SwMjiVepgZw2KkOS0E7GgqDdgMcaOVEI8Z/In1p1bQQVq96eZzTubsql/MxZ9LSK1Dbx
 Emzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNo5Th9oqYFgxky7VgLYiX2/Wtu3lL9Ffldj5zjpsyUMesssuOeaLBDfrpo2sevUwqqcSyJ2rQdtw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdQoSEIsCukzfKc6b1QXnrr4jqL6G5l9Zs1UyYFLjANeh5vhcA
 hZRjH5QgYQt0zZNs1i7hLRkEvyz/r+yPGf4aSC7pCZBljnFaogWZ02oVPfKCHfhSIZgwdkbFA3s
 qM0QVpuwuV6ovyTR2Z15NjqDqHyee63zgwtT1+eJTji4omZr9j1Qy+7xchl2hhXg+xMW0NuziMo
 1P3gU=
X-Gm-Gg: ASbGncteRtnDq83X4RmzlrgJPBsw5DYShZivT72lujQvDv03GOxjCp9afUlVIgSJykN
 MGnx72QMoaDdscflkmqwaD/x2QxhQvlI9eapfcdRXRuPYLqLSgfnnqOoAUwyMfIUVzoOOED/zwc
 wEG8NWkMdr8qGKNWWGHdT4rO938ovq+R7U4B/Uc/wf6smLLKnIJAC1v0bvEPGtTZQpU71uu3XPj
 rB68oVTeEH9aLhPHblchIm52gABnbh6LNh8hTSf6uNYY5QWYiAo+dlGMrWddfFceKVfFTE3mRX2
 5NI6HT7eamvZ9eXIAmfM8OMS4tup8NYIecivBKeB2J5IGjoUPpXKpJwDM6zFOhY0q2IdWQpljhc
 UmPd++pQCt1mTUpXvKp+duDbdDMOhgqbjEDE=
X-Received: by 2002:a05:690c:45ca:b0:70e:7503:1176 with SMTP id
 00721157ae682-710f763eaf4mr229543087b3.4.1749561277338; 
 Tue, 10 Jun 2025 06:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQC8rt3kTrusAsNuIp+4RWIrv68jhYVstYuYleyxm6ZO9onHgFJwUJlqd4EmrytlbgstvxQ==
X-Received: by 2002:a05:620a:28d4:b0:7ca:f37a:2b4e with SMTP id
 af79cd13be357-7d22987fcffmr2356233685a.23.1749561265466; 
 Tue, 10 Jun 2025 06:14:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a3basm1520440e87.155.2025.06.10.06.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:14:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Message-ID: <skvwhicmdzewywoxm2bims4e6geandodztd6apmrolzqpzcibo@fqnjrs5shp3r>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68482fbe cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HWQ8LJbAKwhtnRb1DegA:9 a=CjuIK1q_8ugA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: CsaaJixMfuk55_0D7z8KYKTwIOP8rB4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfX2SVhFr8C+9iq
 RDsZpogWsChnHcEh4drHHnUFnDdz93TOpn3oCi9hAcaZsyIw086hvF148Cu70KglPyr4045ZL3n
 AG3ARaAHnMvIqwTsc5u29een+WiD2xdpVJ+N240lxpn6mllJsdYZQ8Af8jmstOiUwdYZ9G6gBy1
 Y+qBUjRM6SJIb3kgwUulDY4AuSwwe/2nIcDECGKniYKJzPI7HLfj37Sf2OJrVG74Fbd8WdvqivU
 yOPSJ6Re6Tn6b79/BtZceC00nS6BmU6O4GFsw0Zz9jDs0Oisu1J2qqE4ATvArxfNsHVDJkhRZt8
 7ouAcdk5n243UkgltpaXRCAoTM1D2Au8OIGcigFqKLR/oJTH4GrVcqxIaF6bDMCcw83ljui0gXC
 G/ip/qSVn1kKcDKE3FqOOp2jPKRIB1G0pJ3gS0sqefmmRYoMmj/cALu1OxcxTD0Fe4XYw58o
X-Proofpoint-GUID: CsaaJixMfuk55_0D7z8KYKTwIOP8rB4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=799 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100104
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

On Tue, Jun 10, 2025 at 02:50:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Based on the downstream release, predictably same value as for SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +

Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry
