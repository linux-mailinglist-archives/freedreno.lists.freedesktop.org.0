Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E0B4FF5A
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D610E734;
	Tue,  9 Sep 2025 14:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="prmUN5Zf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6F10E734
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:27:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LWXI020625
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yw7Fk6HJCJShlv2t9i0lzWI2
 sWKEgdH07td1ipZYTIs=; b=prmUN5ZfV2hLIGaofH/Lo4W1DdveSATzHd0W0IGY
 +iGzvRjaBZOviw0JVBOne0VMAa+xYjaJQiz9CduoXpnnMFj8myq2+RoJJwkIZAhV
 h8O5fVMVFTMO9/Z4xQZYjxyatQhApvQuM9mcX6EnlzOCQE2RjLGjogxOdG6jS3NP
 l05BHSwOiOV+FnYoz8oU0Ae9nK0DM80ZrlCHd2ufB6rkDVUabBYAJ/wSquyw6+jL
 5sQFL8g1g4VpunkQnD5YzaXkVu+xK5+CIKr3OeCm916HqufXxQTKUYcIUSiZIZvp
 JAzoncmj6INosJaksQzgooREOCMWW2wTD+y7Q4VS2pmuIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a8duw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:27:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7296c012f86so117342576d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757428021; x=1758032821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yw7Fk6HJCJShlv2t9i0lzWI2sWKEgdH07td1ipZYTIs=;
 b=SpTfYuwCtdI7FvG5X4LPt1W3JlAfsuGzXwNzg+jTv+RIuRBjEq/WFux/HjrShS1V1K
 h9Bvq8VpPIoWK/r269oHU1UezqY4VNApZL6P2PLI0V0aBa5zAt2PoJLFazpZxzTV2Zb9
 RY4svkj0ftOmk4YMKr8sUwWB2rC/trXQOxlHNFmypkmWeRh8jYQFnWreROxRQiSBgeCm
 RVj1M6kxj9AePVwDNDc0nPFwwBuYSMLJq8iaenONt85QESGEC/O5cuaVbtSYi6nPGf/b
 eTFHe9gSeO8e4sPcrDDkHP1cdxJDkKfTm9fDOAOnZsGYkWU4ZMV7zYJREhKRoYIUwOmM
 GzhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWaKuVzCaw7FGe8/ttZ2sazv5Qwj2ufUpYEI6O1umt8L9pv7z3GeBolObdkBWOt/bBuDzcbo/NMLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Sdujj16aOYvu1WHqvSzeVeo6pGzBvlF857Sf5EEo5CnYZOVZ
 E/HsKaYtQzEFAj5aiZXR382JmzY5ck11MdNL3Y0oxAPQHkDofteWyF1o6kX0l1kt9lAnLIJmrUq
 mrCruWedtBnJeeGbVqOQRKm1t+z5ZVdMMnSSdHGowalj2bkt5zWn84M6VgD7pHdVRPRz6L1I=
X-Gm-Gg: ASbGncudbWiI0C9h0FUeSsAWx0/xk9Kch4SIBdB7gW70YdfEfzX6Er/MWomm92Fntz8
 jOZThYGs3uqgwnZ4zxhDiXuxyh7BODy9FF6MxBz0shzxKW1suRrL/IBkq0DGp64suV1wwepRH2m
 u9dkdk27QRlHnEQ2y/Xr2VJIkx0V0GAQElkCrq1V3n4Sn6JBBtXkOEsNjVKmT8alLC3OUQLjPI2
 mEP4z9uQrFDw4RRaDXnAbP37LFAbNSYBNg1YrAEyTIUmCRh4k5cC/YBSPM1t4fWmxtcQejcnK+w
 urFPjb2bb/HetSKNMztbkk4adsrQIc/3dK5Nofzi/pmXfcaiVEj5Tm+75BOnesuWDadiG6EJ/Am
 uybBvmviKhkodYf/Gzpq048+A97nGwHqQPzR6e8xex4K4MmXKZAYH
X-Received: by 2002:a05:6214:1c82:b0:725:1035:1dc6 with SMTP id
 6a1803df08f44-73941de2c95mr112157286d6.64.1757428021153; 
 Tue, 09 Sep 2025 07:27:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj+Rvfz7tyFBU8l4QDVUaGg1lYtPx2BNUi8Rc06dcrMp5ZpK2kuCy0o8urhbMPnh2qES05Fw==
X-Received: by 2002:a05:6214:1c82:b0:725:1035:1dc6 with SMTP id
 6a1803df08f44-73941de2c95mr112156786d6.64.1757428020517; 
 Tue, 09 Sep 2025 07:27:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680d0d8435sm560419e87.63.2025.09.09.07.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:26:59 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:26:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix incorrect type for ret
Message-ID: <6g7kftcagecmbal2oclxtmjjbi7wc365nb5wv7jhvyzbttcjz6@kxr6oojsvg6k>
References: <20250826092047.224341-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c03936 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=b381tfKDLOYfEgrzl5gA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: MJqArib_gTaYprcTAJUUyjPL2-MdPt70
X-Proofpoint-ORIG-GUID: MJqArib_gTaYprcTAJUUyjPL2-MdPt70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/NzGiRSdDj4b
 8vU1Q/RTsfmxo3MYpucTN23lv/78aeEUJTNCgJlpg9Q8rXMLR9f+afhKkvzSlbg7yPRXE0gsiov
 b2zYes950WKzehqX5AAg29fK7rwXEZMFBdfjbkUDf/0LHO7TYx39ZFGK6/HpRDMMTEkfLo4tDkG
 bYH+BBz7R0s5nqV+X6VHmrC80YlgeSToCk90XK43TdO3K0YxnjXJyQWe6dInJU4WzvhEyB4prYk
 xP+8euotqViyhXjYEhjXpc+0JNY6AXXIidt4/fuuukLfocjmZmp2KxX0fpVBCmilpRJtzd/Oygp
 AaXxjPwwvao6KXu1SU5UiD9y/vlH1/SVUanPVyVNSUNEOirJ95lKVc0+1E1l9qUGeAkWVwZX5GH
 D5NE6KMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Tue, Aug 26, 2025 at 05:20:45PM +0800, Qianfeng Rong wrote:
> Change 'ret' from unsigned long to int, as storing negative error codes
> in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
> errors.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
