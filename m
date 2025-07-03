Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46374AF8189
	for <lists+freedreno@lfdr.de>; Thu,  3 Jul 2025 21:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB6C10E8C5;
	Thu,  3 Jul 2025 19:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ewcoEFtM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E6B10E1B7
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jul 2025 19:45:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DOX1O020148
 for <freedreno@lists.freedesktop.org>; Thu, 3 Jul 2025 19:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZCM7QMSDxKv2qFBgS+zVkBmh
 E3IR8xSI0qRlItQCwdY=; b=ewcoEFtMIcZSBpo75EPx/BH/CxTkkphmZBNkiuxu
 9Udld1HDoCowXgie/z+7iCgs4fHNay5rp0GSM1qTQvITb7z/VxaWBxOLlKTehZuy
 er5HTFPjJUxQuOTk3nnA4XNwdiXIVTXWTtJFniD8ktHLHoBsMRBu7WnKZQnfyR6U
 K0yFFaDtCzrIJEvE6Q9PDtVZPXKd2qtH+027PjDWDt1SzGrTBnymoVhAIvrvNjUP
 u7B2ymKP7pNQIGx3MNH40Iai2Q1/yBLqybPKJp46plETX5SEHy+5fW+hgbmgZmKn
 KV1f5bwVmUHDq9aiVnMNwSsh8hRyHQ/G0CWi64wUwzLG0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn87w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 19:45:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d0981315c8so17021885a.0
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jul 2025 12:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751571946; x=1752176746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCM7QMSDxKv2qFBgS+zVkBmhE3IR8xSI0qRlItQCwdY=;
 b=i94ahbRoTJRpM7ULpmgATTfRCoi7h8y5L3iMs5SuggmzNIYNF9J0wKzlR7aTKlbdwh
 pSKe7QACjawitY8J5lwNO5rIFTk/pZrBSqKs+yatqGSG/6CWXFQckAZ1WxWMPVS/do7P
 GEozuDl4T3qqnbvFvCGyfoNd5uC9r37uBs8c63eX2dvbzhQooVVFpjtPeRCT/WQpyR5o
 rXc0u5wN44d+yG41nh6d+hWdOE8g9SGPj2dvQVzuwL09rIkzcDEd5t/lp0V+sKmRmNvS
 dORjMDyEbkavjW1BrwzOqP6rf7BmCO0/6nJr+BRlQHhevVgGzRtLyCGofE1ZeKsxWgjv
 DTZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVakY1/nLPs0/EYwKtO+m1PME2qh2HunCebG6CCV89h8mbE0JwitGp9g1hqQsEAPoitlM6W49hamCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM3QiUbg7QcvVSzw39Fa3NhY4Hvu9dBxNwmAonRAtOjxKf3ZRH
 Gvmd0DvDq18GJaKvL4I7CBCLoxzyNkMV9V4Y9y7ZIXmdWge3WUyJsnpU3Bnpa80wE/lL0Y/ijgn
 IE1YbWHMHCHTfaxzzuRsSBSpwcMqRXTQ8NZ153/MuB3iQJGRe3/qotKC5hi9qiDbDxRyKrDg=
X-Gm-Gg: ASbGncs42ZJ8dWtUgfDLKIZxlCum9dn+Pj0lBHu0n8RQSRUkrSW/fjfbk0R1LEgXe6G
 NCzp9F0nZgswuCj1Wr5jCZ996wxBnF8X8ekyKk3XHMxqKPeqgt5kwOBdEswdFHiPwJZuMKRBQcL
 wgmdI6uNgb0QrnHqwou6jTQr7Wryr3bVUVp/cpzv35Y6WFSCtDh2FQx8IoZxpwUNZA8UqIPifaG
 ZQRGvltwQiWCzPB8a+byZrHaZGPuvH/puXxRjvIaTxzMKCsqX0Bv5diYCSC0mMeixHWBEF6J7Ps
 IA96aHPQiZZr8INfIJj2jGvIYY0tpemeTZeFDsfuj2Ku9+4YYFAzArwL+uMRr/M7FjkNaaZrGp6
 ZLPtD6ejcnYCZFzUpHr3ELiD6r5ufblPO774=
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id
 af79cd13be357-7d5dcd151fcmr21172885a.28.1751571945576; 
 Thu, 03 Jul 2025 12:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS8RFdz2f0aAezmbC6UWYhes3/5YevtRWhAWpjVXlYu8m9CftEOm5G+GE1c6x1xY4sKoE/uA==
X-Received: by 2002:a05:620a:4586:b0:7d4:6506:cb63 with SMTP id
 af79cd13be357-7d5dcd151fcmr21168785a.28.1751571944980; 
 Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494483sm55037e87.99.2025.07.03.12.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 12:45:44 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-ID: <burq5f43rrr544kn2kdzd5mvdi4yep5yz2g3dfortldchfqag5@23c7ciirwrfv>
References: <20250703183442.2073717-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183442.2073717-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX3pr3Ho33cZHM
 0et53KoRGyWQs18Gqi9tYSW7SfNr2PDImbJMSvvqy0QaQld30aUqnwPwgqZGGt+cNt5ORAlJqUm
 kSH5r1x8ZCcIIs2mhA5PAYzeX3XPXQdecVHEeMKbNRy4BuUq2vI/K/X4mo+RDeBrzLlMrlXcJXJ
 ISQLNPs4Z4AiyfIIYefWEvQug4FQ6EgVh7jQah25K+9gAIqYvXtwVgyT7Vrobw7b/abU/CCys3a
 EgHUVgTNxc6b1KfEKHAN8i6qJFD2irMZoznY5eGCusvSPwyVWlYUuFxDkGpAHkFEj1GsNNOfKcP
 VU7aU6muX1mxeHQkTOY2/33tu8QEokUOHQAakHtOfQLC8XqYT2TXaUzeFciNCi6BVbWpz96JYkj
 aweL/uxEe+VRylcMkh39bWd+KNx31ZTYEbxwnpXvNAwGpFT9iyGCYrk3V73Q9hnk2h3h/KVy
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866ddea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iv_ZzY4-czSJ8NSb4YEA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: r6batBkv7uTgtLb4ijsN2IlhC_5nCoNu
X-Proofpoint-GUID: r6batBkv7uTgtLb4ijsN2IlhC_5nCoNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=765 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163
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

On Thu, Jul 03, 2025 at 01:34:41PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The original code did not set 'zap_available' to false if
> of_address_to_resource() failed which seems like an oversight.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
>  drivers/gpu/drm/msm/msm_drv.c           | 15 +++++----------
>  2 files changed, 10 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
