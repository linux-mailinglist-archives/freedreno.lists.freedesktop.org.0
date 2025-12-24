Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AECDB7EE
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 07:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2529F10E338;
	Wed, 24 Dec 2025 06:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrDFoehr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq6LR5vD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E9710E338
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNLt3NU700694
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe
 /Sb7eB2QeGBD5SBBMi4=; b=XrDFoehrzciAgNzkDzThZtCrvgFQ/QAl79gnSPO2
 D5uKOt92DLBoGZ2Xt+Ttz1rUtFzEZYJy0xwTYSjvyXuw2LD4BNkj2w45mWzqVX6q
 JbftIL3H2Cjw8VWn9g8jod0eLhc4luczrqjH355srPEhLeZ3Hpl4kRrUBgo/kxjp
 EgBx6JD5BLO4MehVoRoBOGac9La2/273gDxnpDjP8n1ST7cVw36/0BZt4ERP87s1
 ITE+0KSBk+ApXq8VJqXkSP3RBgWRBgfll+bi1IZCsxL6afaZaXTtDlBfUqTU6Bvs
 VB975/nV2WuXfsDS4lpMBZPg40Np4ggN2pxm8KjizhS9tg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jtuq8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1d26abbd8so154016691cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 22:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766557842; x=1767162642;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=Jq6LR5vDckGvxtuatZLUT511wsjzhpEg5IyFS9U23brKFO4ICfITiX5F3kZbV7PZpZ
 GsCD9J3y4hXDivUbK8Hk4FaWYiJs/NyOnvLWUflcCzNS0RKBpc+LMxRpIL+zG5nCBGsj
 rkBokFXFsPdm1+9KQjFqbNE7G+/6uBnTkiZzgmKbRQSc340KZwNIMzdB4+P975RQDC/k
 S+70azzY8me9EYveBZ7Bj4t9oJL1x3ChgawCXH0N4wkH47TEmnZl/y+0N+HZrtxQPBrf
 Z77UI20k999ds5JiTYn7d1mklOgM7Rl4fShz8JWXJ2N+tSj97ptdVKuneszNRTqXVyuL
 9VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557842; x=1767162642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=II1LuVjnYykB1JrJeNzFviydZY20s9LdY8J9kVV5L0VSADs52aNaPhSUnkiFDAd31e
 czLCQRSwqaPTYVTQObshG2UtDe2nOtUSh3KNS4d9iERKguZMh4OkQ1CZ6lv/pgiR+4tb
 7w7/ohSU3E8OaAbfaY603JVCs3stFaEA2wZ0Yx/rBu3YZ4d80NYe6f8fKZGwVdE4r8oB
 beH846s1cWlQWIgMcgs2xp6qA9jGbb42tU0R9DV5i/ev5T3GYrDPcpMSkL2+JqeQxVC4
 eWMhYB4pmYTKBONho6xzQtikJpYcMUQ989uPeDz34+BrFncPcGQN47qZy39Hchl22fVz
 iEVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmDUBZ91AvDjXDa6mXCxDN+lqOmWfDG4F7eAqv60tB5C+9xEjrV1/qQeGSXGx38SCNZKHJrbfJfqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRwd02U2mzrLE2f2ko+VVg4y3rrJS0Srfv5wHTz53bzZ9cBikJ
 BDlX1NkZyfarqQJS3l10hwYeb/t+5IyMAXChxs5nreYPZOGTxlAzGXElhRFyCEXqQ7IubPHrwP0
 R5JWHk7I1/xVia6qRep6EyCZaumNbjO+BNGR/yZcVqkTcw64E6CKwAeOR4DYlfpv8d1LdGws=
X-Gm-Gg: AY/fxX5mSNCTHH8sXxyaN9mljMCzlmrvZIM6zVCoVK5e36ne3XhZ96FJ/dWH6csuQfj
 WXoKyHFURn3GKr6IQLyKEfL3t/xsK/ApacKptoRnQZ2afZmR5Nt4dw2TQnDaAEATke1Tf4uG/sK
 aWyILcHB7YYIUnqGoYlDF4BGFgSBVJah7+zyUJnCRE1TLqnDFEFDDDLRDzy/4K520kBvGmSpkbi
 TMW1i32t6mWX97wuZKMeh8qPbSswmyMrvbViSUV5xzygCCF+We4B8dI7QE43TwyWTCFf2irX2Gp
 Fcm7VsU45AlX6Zx/okNxMO+dtrf/FBJeHZ1gq+gdE3OcCYZBsGybAANNB7yXzCL9IeUqF2ppyhq
 AmyQBrbMsVRkXVJuNO3eMDcyYqAhrD3Aupwhr/I2I3TPhVQElmkMOPYHAMiuxBJBnLyosHcZOH/
 YlSfrL08PV7CSizi34sRfGyJ4=
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id
 d75a77b69052e-4f4abdbe4c5mr271860001cf.63.1766557842498; 
 Tue, 23 Dec 2025 22:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs8OTLRrX7w+WgO9mKTBEV/5O6XcUqQZtImlGkrnAnKULcRdKtjdo/2z5FmNuRMxsq5DzMQg==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id
 d75a77b69052e-4f4abdbe4c5mr271859751cf.63.1766557842139; 
 Tue, 23 Dec 2025 22:30:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd7c8sm4580330e87.26.2025.12.23.22.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:30:41 -0800 (PST)
Date: Wed, 24 Dec 2025 08:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Message-ID: <bphspkokcyfzd4v3sqdkq2xwyfahoi45zxcdhugewuxzaymgsl@wkpbbbdcm4x7>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NCBTYWx0ZWRfX4qqga9co95Eo
 0FcBBq5xUfUF4S48B7oVZgxvVBZRNtEXuEkeon2v/Mcz5UMxCDyXhLHIMqXlfPuC1w+ZqLqGgon
 hWgJQSdHBKunEzhTl+k6/GsvujxZ2rJg0QbOZgE7QvLyINGc75j2jE52ua4+uW5xTknKdftYO99
 36BMBmErd8m7oND7oKKe47xHOtdCaldLkEcC87hMaKDPfbrts8LnAhS2rEQUEyTknv2K4q7xRtz
 dw8rEI3n1v3iqsYNNPbZ5qWWhdvb8vUwdM5upxyloizkdzE5Qxrr0+6ZXQ54MPM9CrjmgAplX9p
 3G7hcGcqhFsN1rq0Et6gbJZpfcq/XHC3Up32nStdEaU3uZo3fgEoZ6o4+n2JiY3jlxmrlr5rRsN
 0pAPhzmq2vExmFaiIDLXETO9WsM+gISkrzXt3HdR2ucvM79Yh7pYd3t5SekR/QARhXvvtqgg2tE
 VtoBzaXBUcBriTNwwfg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b8893 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-GUID: AXU3mzvmSgQvaIoasdMcxqZSAUMBag1T
X-Proofpoint-ORIG-GUID: AXU3mzvmSgQvaIoasdMcxqZSAUMBag1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240054
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

On Thu, Dec 11, 2025 at 12:36:30PM +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> Cc: stable@vger.kernel.org
> Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
