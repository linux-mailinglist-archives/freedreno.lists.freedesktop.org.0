Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29414AB7A9D
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 02:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421CD10E0B6;
	Thu, 15 May 2025 00:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyRGtW8F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523FF10E0B6
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:32:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKGBqH003073
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jMX8MEuNbqB8c/F1/VjebPfy
 Bmoob4q2DgIFRmEpoZY=; b=FyRGtW8FJBxPZRuJS3HpFlnhHAVvxQb6Cx0f+4Du
 KvVR/9+TUAAOJnv8aVF0fjOfElZ4ooF1XRaPdjZkjATsKe+GNPdpORQgr/WocG8m
 Lmo6jOa6DcSqNGWLdeDbC/11ukij0qsmCpBk5gKZTaCNtTOb1w4+DaLWoD7+oFDN
 ZLxnVcAA6fr7HtQunJ1uKjd2386a2oqaS2FHRGEkOlszFw4yWRHDF5ae6sV2Ur4r
 OcNGUEsOhkiCEvyPWYTK8yBFPNnmWfJYD+Btnq6dzXmHL8rH4NZEkq7c//+CrN7V
 cEs/slPKYsALcfbzXVHc8Vqm6fdNpVUvwGhR/gKiRI9+zA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrcd1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:32:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so95445085a.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 17:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747269167; x=1747873967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMX8MEuNbqB8c/F1/VjebPfyBmoob4q2DgIFRmEpoZY=;
 b=bOkuQo1EMOsT4qCYJHIYcLyQhb1YfnpqpQ4ZO3hl29CMF/m8q7f5WS4WLa1owoXUnB
 iypCt0EAp/bvAO00Sj1qwdh87SJ/VgijDuZkpNU7PGp8xjr97bwsol8v8ky7VDEhdkKQ
 L+Ji79S6hqrMLxmDPEzye1FcD3Xc9zLyBHwgwIvgGrHxU+Ru95sXhq/UAhjrdQf8ESLG
 m+GshG91LZ2NoXebyvJByaJ/1RuZ5mB5JgGggH6WaOun1Ioxoz1mEE34mxYTupClRsA8
 j4I+r2hkOWra0fyEUg7Pu0ShyMhyjaoztAUOA+g5ly5U3jOgElkBKZEI1n5rAyKwv3QG
 tXHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCfrovn1Hu83ApR52r+0wu/WQ1e7+8wMRxoDw6rxse8dG5VRgcBCaB9nB11xoml8gibKHgukeV1Z8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvZMbFlRrCiDXTw7+IgGulFiW3L6GvVNcRfFUndiXOXyqJ+26Y
 IX6LKszToGMWZMZmfEzWfxO89cUdlU9lU2G+ff7rnViX7Fpeq5jPMUe6fpG95MItxKYYuiBxXfj
 a4AAReke6QETN11SpsrLRO6btN3duvwAOHPwwejgTDNEhWYcZXNz4TnBt52B9AzaGLRY=
X-Gm-Gg: ASbGnctqvKSepLYNBb3y8BhCbnep5HoKnCo+JBrnRDXO79mQO9lJcQVbqHYQB7bVoye
 S6nCSXkEA1R53harKJOGltDVBSoJ0otvpPY2c9c50YERFuZ6zX7AH6/e+V+vyEcZ74CIRbB5kW4
 1KzMlKweAnpA1JGj1cTunWjOxov2TaBFBd1dBiQQP8Lo8BD2O7CIPf7p97/LgpR1fms2dN9izGo
 pXYEnng7PAk3TrWnRlan9c3P69+2xUDDxgiE73A9dfwDoZTAu+uyx5Refm+SWSFdPpvrUrKrgoi
 m3DaBBOcRb1M0ssDys0MN8/P0lh+7DnJAlUq3klQSCW5pcEdJy1wMcy7lXvU9wLs37R5HUhAxlA
 =
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id
 af79cd13be357-7cd3c80a6cbmr61022585a.36.1747269166827; 
 Wed, 14 May 2025 17:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1frL1HZd5yd5hFRUBJhSomzVm57HGiu4Y7gzv+uda4Y1bA5fiAlWFerS/koCTLMIP76ifNg==
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id
 af79cd13be357-7cd3c80a6cbmr61018085a.36.1747269166342; 
 Wed, 14 May 2025 17:32:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf90sm2401020e87.71.2025.05.14.17.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 17:32:45 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
Message-ID: <2x3wyi2pfyax236zuixmk6xi2agooy77cn4goaejirlms4f7l5@7bhybz5llqtt>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AWJmwuhzlgviRsLyXjXb-pzrpql_KQb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfX7QMAdFNGHRAa
 P5pg5ZuEn7tUZmC/0yx7N92tdBZ105KhidNxOjUpOg6OhuvDJgXWES8iZPNKSkuPpoMijVGZMoU
 LBbi4lS/owB5jKJd4XVNIb/tJbNhierYjkV0haTpHm2BX4FOUzDLogHhrqAnyegHY5pYe01DQE7
 IdjpQKylhvTh++CzToyIzbbgj9Jle+2VHt0PjGadDfRH/ooKHTW4iy87PvZo8xeXo1cBVrzv65v
 FYO68T3nt0xVAov2XvZv935pqC93LKvCOEmPpAquGZnLKmM/Ur1w24qFrcwKamywQ5eVeuwfl70
 H/dWP13hC7oV1ujbX6Seh0x4H3sBJoY+YQOrcV6hykryMLBg0zksusvSQOWJpWIVRkiqXsF6REM
 9FdBhVl6eSRdth60j/fieSbGeF9rbthlaRfW9VNKhkD8bCgD2PFhwPq3az0PEUqxPrLouUg2
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6825362f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ABbDsRMl8xt5kB7kq2cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AWJmwuhzlgviRsLyXjXb-pzrpql_KQb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=727 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150003
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

On Wed, May 14, 2025 at 04:52:29PM -0700, Jessica Zhang wrote:
> Drop the unused maxwidth field from the dpu_lm_sub_blks struct
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
