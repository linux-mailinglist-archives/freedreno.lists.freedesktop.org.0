Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1790B1F1E8
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 04:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7304F10E052;
	Sat,  9 Aug 2025 02:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQtr0TCA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35D410E052
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 02:14:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FS7LB008016
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 02:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=d8V82vBwUz1mJ+IWuJuo2vsL
 /UFk1BqGFbx/Lzd+kf8=; b=IQtr0TCA51V0mY2vJcxwuMa31dpLyn09YQndPGAQ
 A3OZw2KyvMcC3QdCOOdDXibEQxO/wXrJJj8VRgTI5TWUWVdYXemWlaTHCzX2mKg6
 /ZjWguNe9BwlAE1Px+zzEFmMqGkR1XNgIW21jEzqW9djN8Ql3kSYOcwutgptrdj7
 H70st6UGLQtW6HLcv/59csvO5g6Oc04FoSNDjT8QYi9JCqerP7a6Mf8h29z3CyLD
 VxR0BihDXoNfq97n6fbtlupB6eiqIXajqC9wctCo7rjXN9v5k5B75Avnb9/NMAlT
 g09B6ofPria46uQ0aR+OScIKET3vdp2HhF1NRy3Qg8OXQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy73n7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 02:14:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4aedd0b5af9so55554031cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 19:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754705695; x=1755310495;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8V82vBwUz1mJ+IWuJuo2vsL/UFk1BqGFbx/Lzd+kf8=;
 b=WBridw7inETGtnxR3Vo5tX+O4P2hl1U1VxExCN8C4Y+7wSu5DElKRgLE45dCRPnemw
 PqFa9QHW85DHvKoDq5TKZ/Cqk4AGgJcMDNa+X1sfsLXPc+tCsFjb7t0dgM1+aDEeX6BZ
 CfBXRkb1kG18DyCF+sjM25guFaL50OlqcTKZk8zT3pEw9tflXQS8Y3dOb8eA8U5encv4
 WCL8cKlkfjZ2ZLClRXPqOP9QuAwvei1ZL8k9bGDRTQr+Ly1f8+J9UchPqO+PcDuvhuQL
 7GbVJCHr6XaEx6rjz3RPZzcem3OAw/M1Ucs3l8RDckYHvp7vsjgcObw9/sfQgnLgGo9S
 JdXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3tbiRVivAfSU+O1GZqmzygOvyGnJb1+tj27rGpacC5vtHubG9XuSWX+qnmyQXLV40dnHZ9zI1cc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoAK4WfQ77nQBj+DMnVX7y/7CrBmFOcs8XnIc83MtMDZ/EXdch
 O+tb8Y6oG408ncHKmcJ2tPiHBSgrBeYUBfanj9Ct5iUJf72GgE2ay5RYW03xG2DX2riZlf9kAtl
 9qSdIp32UtNKNUK8zaOsd2EkM+ePg986fGl4KxhLAiUR1R16/SjGvA8scW6UjGkjx8XdSbY8=
X-Gm-Gg: ASbGnct2DWRe+sy1yblGUvrvuu1mTW7/DQ8vI3HaG+thAKZ/JVx2MhrJ+xLaO/TFLTL
 dyw0FeC5mwNb+eJMLdrKks4vm/PA6ubq+O/1G9+ORDCGIihek8USmvdxbSIuQZU2vene1dEc5ZA
 w94Zz55f+SM+2Bo0IVLOJ9HKibOTgYNz4ybwrXl2V1EZ2dm5LsZLwVawDKvHMUowo4uF+98st3E
 Hu/nX2IW6/V5ubToNGpJYa2o+u6fLCen+DVkWN14tfuOdjGzIT4V2TKViFCBMxTt7Y5U77EIS3I
 OcqhDWBMlOvYutS56KLn4tGxSRSz5/+zolO/yz/QuseDlDHVdIVq1SXNbLS3J1dZH4KUFlv1aHT
 eN+sRGxBDYM+DeT6yF4y6AFzB6foMw/Zt8Lc9EOdO7Ah2X6sCq0/D
X-Received: by 2002:ac8:5749:0:b0:4af:1f61:7d39 with SMTP id
 d75a77b69052e-4b0aed21313mr106146051cf.29.1754705694676; 
 Fri, 08 Aug 2025 19:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5aRbQ/NlwN7L7iMrcnkgPVM/w6fIHpvroCwE+0c/uE92MdaewoP1y/ibErVYY6x3kEp26cA==
X-Received: by 2002:ac8:5749:0:b0:4af:1f61:7d39 with SMTP id
 d75a77b69052e-4b0aed21313mr106145681cf.29.1754705694224; 
 Fri, 08 Aug 2025 19:14:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8899f897sm3194466e87.49.2025.08.08.19.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 19:14:52 -0700 (PDT)
Date: Sat, 9 Aug 2025 05:14:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 05/12] drm/msm/dp: Drop EV_USER_NOTIFICATION
Message-ID: <ykbudesvb2ya2gbtgbyrcn5niesul2bnpfsrl2hourpw56zwdn@y7kmcd2ejwxz>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -e111FcSU8XBDNVYqqtNWpSSUDnujMU8
X-Proofpoint-GUID: -e111FcSU8XBDNVYqqtNWpSSUDnujMU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9Cghd+ZhfUDQ
 7qajOBdjvgPVb5WAICIJx+W4fObmYKB2wSIteC1WaH5qtHpeL/kVK6dTKyNKh/T7LGPxOMhG2qT
 nUU3/oE4SceUCNDK1TXFUpmf8HGMupPmuDgMJOupkQhu3zacLqgIyWqKCsTU6vUd/y9yd4MxWei
 iCEsoszSqfTjzv/RDJRWQXC1a6rc0FgZaSq4Xuz7WYoNaufKwppMhaVharRZt/VHVKgiwy72emk
 Xi1zY2jaarb/gfMGNWkstchvlcXXYfYmUdTbmeqTd71S1ni1UgzJN7s0ubrBL3kPubxG3C1aK9/
 a5IOdLkMmWXn/BGGoHVUdDwYup+TGgV9T9MhOU1EdA8Ou+7pZ4Iqu6R78wk6LgPrR1SU/2RfXWe
 xOoCuW2Z
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6896af20 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=93MD9rSA5G_0oRVq-qYA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Fri, Aug 08, 2025 at 05:35:17PM -0700, Jessica Zhang wrote:
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

This removes serialisation around
msm_dp_display_send_hpd_notification(). This means that it can be called
this function can be called in parallel, so we need to add locking
around .link_ready access.

-- 
With best wishes
Dmitry
