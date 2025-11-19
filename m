Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472BFC6D388
	for <lists+freedreno@lfdr.de>; Wed, 19 Nov 2025 08:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3310E22B;
	Wed, 19 Nov 2025 07:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QF6UHhWC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLO5ND5x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DCD10E22D
 for <freedreno@lists.freedesktop.org>; Wed, 19 Nov 2025 07:46:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AJ2E7Wm2755312
 for <freedreno@lists.freedesktop.org>; Wed, 19 Nov 2025 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IBAqYgoC3NcK12CXgRQqeftd
 fh5IwqH1tQpsD0TalPs=; b=QF6UHhWCcN+aqCmp+7GGR4RkddWfnoaHU/QiqDXr
 t/7ypYsPxmOcS/0jY3++STggvrQ0E3nyukWbl1H82WVaTVcEJ1GdIJQ+wCiWHCbI
 gHL6uGKurZmweMeXPhNMxhX6wu8DgPf4bfElMvqibt1nCtPGXNcjyYvzY74zlSrX
 lBZ2+jSajX/lGCXs5ch65TuP2r5Xq9oUIA0Pbq0g9YdEaGzOqPYP5gfJMUK/0Rj+
 7FQE/By52rH82zCHURcafIJfWoEXBwMNfgB1tzHjQJEGMO2kqkkGme2n4wbn3luM
 FYKEwWeUEA7lazWEQInRGDJdARS4mI5RHlX4qBMxuplzow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj3p6s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 19 Nov 2025 07:46:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2d2c91215so1259349985a.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 23:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763538391; x=1764143191;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IBAqYgoC3NcK12CXgRQqeftdfh5IwqH1tQpsD0TalPs=;
 b=bLO5ND5xuCo8ZIuFQi8ou8RJiQaY6DYSNh3R/ZLLSXXEHfPp9xrKVOIb9VbB1apTiU
 SvoCxqBy0nG8+gnVTDo0gvLpKR2r/hiKWVdhy471WJ5H3RuvRetGMiXjxTj4mnKDjBf9
 nkinPTJD95h+dNtFz/2sEK/fBtYiz10nrbqDXksT5t4v62TmcoQgaBJRtW+xBfpjqa02
 aqMW3oh0JtcZ15gVQu0Fs7bApQTIbawA/Zl1kvGS9RsW6nhmkdPpi7Ib3SGtgDgZDTrE
 +DWYxyD3C7r/uxCywxsnyh073x7bjWaAi6iqEbQAeReUWj5wTlfW52mFf7okMguquWwj
 9g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763538391; x=1764143191;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBAqYgoC3NcK12CXgRQqeftdfh5IwqH1tQpsD0TalPs=;
 b=q88hwf4iMOrSbKK3jhxUrPJnpbG+iey3kkDHVU86b5oWfQ6JjHT/wTUqHPBCR5P2yc
 EbxQ++fAZYI3FagXp1lEs5R/1uyc0By65us4ncQtI+OlpPXLQDtFkmgnjf2oAWpHHLV/
 STkx/ahfiQkHeDWiJjd8jDFe/uazlV4Y89wqEFJN03YMmzW76WZU2QC7ljVvoz1wIdNL
 VGzWOli0EIDV9Kl67fNKHqlbnASOV1mlUGI/eVgFWICf+uO+J/+UXwvR5ANfgZ4b71uK
 UwgJ3jzXYn3oBewzPhWaW22mQF8wHodE9RGU5sT2Si+HZSCleyCZqYumN6rb5p4+6ArA
 39gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+KZIxTD51q7BS9d5MhmQnOCx/xpuFw7E7rFOPPObULmpswgaDOUnhvfK23LY0CefF3MIMgG77mp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwt0vamXXChvcrH+MJBe7afkYjJLp6qsKrDAQn99DeNPI/pT2o
 RGBSkT5imYJK02h4scYZo0sBsFf/7NSaBUoXAb2eXys0ba1OMo7Wo7Gi+dDMGKIZzX39YHkFLXF
 76Idb/fyOkXoEV20WAgcjrC/Tw61cBVsQ8arUZR55cX0eP4nHWPeuONKdNSEaSXuKtRIx2mQYRl
 w5sj8=
X-Gm-Gg: ASbGnctStKGblVQvK3dUdFy5QncgX5/PEmAI0Ik2Q4lVKjK2Q6b6aXyyxysOYMHHUib
 5Qzm2a/GeKucEYiop8Btb11l7OqaAC5oLj7w/W3mMUIWyNKAbGDBfTPETraWTX70V182k+Sa3Cj
 ZVf8dQe+K6UzUBp7foQB88JTnKTSKGdBVkuR9zXUWd2+s61Y5SQyp1kodg2m6D7snO8Yu52OylU
 ZxncH0Ykk4ontQlK33/hw7WwO9XAGz4beR9DCJT1GS32AncHVw7paOMCMXFLpfhywxLWCE9ytxS
 QBnPuWJ56uZw6HXoT5l4Q4eHjX6Q2p6QMUET5eKOMfTfzXeDgGWl/D/slsAdddn2Dh94AEyqe/+
 k4QucQFjlrALxAYvpNSFOFS1SQJEOqut2c977IjvSRzssrxLX8XdNJyPdAhFtzWBLIfQqjpn+Ng
 XQxxF6+IloeEyDBTpxopgZUj4=
X-Received: by 2002:a05:620a:710a:b0:8b2:6ac5:bcb1 with SMTP id
 af79cd13be357-8b2c315e7a5mr2293268785a.31.1763538391307; 
 Tue, 18 Nov 2025 23:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA4wmrNSuhZVNftMGwtfc7b79ei9agDO14Bwd4qs6lnZ5oWOxk0tzIjAsylJOdfgDSOk3CUw==
X-Received: by 2002:a05:620a:710a:b0:8b2:6ac5:bcb1 with SMTP id
 af79cd13be357-8b2c315e7a5mr2293266085a.31.1763538390794; 
 Tue, 18 Nov 2025 23:46:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803aca3csm4498327e87.5.2025.11.18.23.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 23:46:30 -0800 (PST)
Date: Wed, 19 Nov 2025 09:46:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/registers: Fix encoding fields in 64b registers
Message-ID: <jzbpw7arty5zlisrd2m2na3x6birmyrjxc6l2agimagdgq5m2a@2rltprm5bbcb>
References: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: EdMlVB7JJEKearOEZyX9x7qe77PXzLTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfX5WewEVHJgsat
 3Ag9UoaX2zMfW8tmd9xw8n5wUZUL2P/UwxktEEDYHRJ/0YYBuQcMjYt8OZbTvbbRCuI9N6kkvRh
 7dmwZL4NAar0tRoj6DluSQ4FOqqkwEF5/JEl6zIxV0RzeZJjEQZ1e7YCVuW81wdkRH147Vf2MDZ
 DV47XItc3zCnDQkuRqr31cETtuAgIDmOXeAUxzqZ3MEhWk/duB2AA7Ry5R+DaDDV242KrdK6NOV
 2G+AtB2TN7AFnco4axAHQT/ZdVWSVSAeWFoB63K63FFYa0Xiw8XkDKtuWjhn9CyAncM8Z1GaKIe
 ZJPiDQAdj1LvpNMo5EZiuTE0cStzvMpkJPmXvxix+QK6T00PUPRMSyj0f//mpWn6Chb6EZlHnlK
 eppT+gSbSDVFdrx1Dm9beMHgNGfUbg==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d75d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y2wA3AESBAQWwZuG1xEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EdMlVB7JJEKearOEZyX9x7qe77PXzLTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190060
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

On Tue, Nov 18, 2025 at 07:07:12AM -0800, Rob Clark wrote:
> Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
> fields in 64b registers"), but with some fixes to not skip emitting
> interrupt enum values.
> 
> Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
