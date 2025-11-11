Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2EC4EB8C
	for <lists+freedreno@lfdr.de>; Tue, 11 Nov 2025 16:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B661910E5F8;
	Tue, 11 Nov 2025 15:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSTDB5i7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SprWkP0Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91B310E5F6
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 15:15:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ABBGB4n2165212
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 15:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CjKKGdy+AMszA14Vtt/l8m3a
 QXJiT6/yjhYIisPUvZQ=; b=SSTDB5i7faGe2QE7r13C7DknfATvEUEtR6fOE4pf
 50B542HFwT3LOJD1vFu4D0e1k/QqsNEc1f3aVTjIsgEe+VI1mvCEPmMHR0dGAk6e
 XWR2R2lI3WC/Sq57FzRf8OHyUfv4Wr7ky25dF1rDbUoC7bvGYkOuY7X7S9PjLqYz
 IYSnBCyf0rClzhrqBrvsQ4Zuta+lBQ9/HIyf3trUWUebQfuBboy9CobPYd+DS0jX
 n2OLJaYH+V8d8hpkWDjRWstWvcot9jlL+2bWbHh8hFboAYTru4xIHSpezam+Ac0V
 W97u58CBQZutu/0nOGaJNXix6hhZKR/AIeGyslOMzZgMjw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhhq1u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 15:15:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-55987ebd98dso3077839e0c.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762874133; x=1763478933;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CjKKGdy+AMszA14Vtt/l8m3aQXJiT6/yjhYIisPUvZQ=;
 b=SprWkP0YbuYywm5IKEKo383PJtNHwnf/Wn3ZkemqE2qvIdsGRplRRsnPDJwJunSzFR
 NjmkAaIZ7AsBI3qFJ/SaYLK535VHoUHnNM4T/MyCig80iYnqLijJ67g0iD0DzU5Wikgn
 IUvy1d2kMaMmqb2F4XgpNHh1Xwvtfr4LCjmgHCahdfFy008mIgvGILHAWM+B6GttN2oD
 Y/AhYlliVRyfDzlHydtSrl/70KJubvsNr1yD/lgOsONSR+7BnyS2WMJFhnoeEy0OrIlT
 3g9/q1AgDCXmal1uQykU6zb4B/ItGeFXvGzBj/ZoPsKouFC0WhtRkg+J9UWxzMn2PVBH
 b8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762874133; x=1763478933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CjKKGdy+AMszA14Vtt/l8m3aQXJiT6/yjhYIisPUvZQ=;
 b=WnSdbIBm7bY+uiq3ZBkFQPtNN8X4vQutNbNmsn/ugOLQD9Ni97Ni0ixTCotkCEG2fW
 5aYpRoOGrvCrO5Dn0dwj1F7Jnz5dyGM464ko+OH9mRqiyMrq0AN197OOGtvH6v8HAPnu
 WBXgXG33YVMC6fSaueWjbD5OvEDQMCOE+5nBFMUy9343BcGVuMqxo9lYvJOcIy6MNoIN
 sT9tOZNzSPIMrCteO+LECf/i5LX+2mxTV+vXs6dKHX6hymQkaD01Dsnxxc97+Y4v0/Gc
 3iO1vK43aqjXi70IYK2+91qA4/O2FpGtUkk58B73yaN0jm9CXf35MQm4KIYXPoEvyLFr
 Rz1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuElcDccz2LsEnp0ax6T86j5vhUwbnRal4H9wgRwGoSqQoHUazaeH/pvMs998LHdpUNj5GX6LiCJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZEp2CuLbMGlmVTOS+LsuYSgipYxTFQhKF/+8q0dZ/QVa6A6pm
 tgM5JURmtcQxZQeFQcYeBk29z7fJhgXlxAit1/vRdpCU4/NulPH+Ue0yrIQVttlWUZpk33p3QsX
 NJojoCeSU0g5C2UAP+TpUPs0Pf8mds7pbWdxKCn7ulb0ls4WLh5ZWzS6+ztRwR2O05hvDV6k=
X-Gm-Gg: ASbGncuJDvR4z49HPQuvGzMqz+Tg5ebmmMWTaysLQ2K97oZr/3JeNZMjyC1Tejvubw6
 03M0ohXQb1eDllvM6f8yPcioZRcmSVkcpw706n7wJbtYBAx3HL9jCy4e0H4QJ0pd1hBbNjIdk/4
 xzTo0EqWndGhkXi53O+54/G3fJiP8/n/khWEnr3cnGWUNR+T1C+WeyhQvW6QEVRr+zmP+Dk6f9J
 j5QSl+irHhdLuM3trRAeqzTw5A5dfNif6Dwkuj4ogweG/bQ0PxMrgXuVQhXgCzdGAOCRJPXh4vb
 CFjD+LLexGbb81sYXAuBsDdNCcT/I3a73laS9nM50EmynwNomCEojlS19sm2kwKdIzd4C8homqe
 j0jGnP55DIj/us0abFqio11hYdj1uLYGUWbnoa+el3Fr59fXFHZZEYuZ44XiUr7jE1ZXqUsWfob
 CPqdHqJS1TR1Cq
X-Received: by 2002:a05:6122:1da6:b0:557:c86a:6065 with SMTP id
 71dfb90a1353d-559b31e0ef8mr3775564e0c.1.1762874133062; 
 Tue, 11 Nov 2025 07:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEha0gnkPHAna6X9i6xjCWmuSMtW5oxVOyikglWY+DdHiJHzfMsRvKRHE4SLpIP8nCRHU7KvA==
X-Received: by 2002:a05:6122:1da6:b0:557:c86a:6065 with SMTP id
 71dfb90a1353d-559b31e0ef8mr3775518e0c.1.1762874132456; 
 Tue, 11 Nov 2025 07:15:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a5f058374sm44648861fa.4.2025.11.11.07.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 07:15:31 -0800 (PST)
Date: Tue, 11 Nov 2025 17:15:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/disp: fix kernel-doc warnings
Message-ID: <f4pm7d3lkra5sgkuui5md3u4gvvccngrcgqwx2bp7syed2u7x3@ziv5vbcv3wzb>
References: <20251111060353.1972869-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111060353.1972869-1-rdunlap@infradead.org>
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=69135316 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=rK8zvM0c_VZnkeQV2f8A:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: VZToa52CWNNXQuMRmARQNH5Q6eqC78zE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMyBTYWx0ZWRfXzjDcSf9JMcoP
 x8SBonsLxkRQblr9UHDYHYC4mOL/LCW0vlBb26D72/jnhxPoGENebhDrZxll2d/hetW529zNzpr
 bc/D8mN5P+CE0y7xUAVw3aFIjoS4RL3ZAwV022Itb8xC22+/1YL3keZmdDRP0RMletvoAKukAAN
 vA0QBFNhMr9eclAZnhugln8/EeXKS4LP1uT8AotmHxbdo3gwdh/i7IOiyZysbYO9hIaiWHdy3Us
 RKlKK4Lz9dUdm7dKo5i0P47Cnho8iI9CAKk/1nk1Qn/o4oVlbSq0nbZQmx68rxqUf7wx4xCHukS
 zhABA9nP7H13GTlZmbTBgZ79v6WeVzXNGNZpYpYD+1WRqvM+M6JNQiDKE0MYWGSDU2ySmegwmVJ
 qeE11EBrAzJ8tRifxnpOW8ks5WkMXA==
X-Proofpoint-GUID: VZToa52CWNNXQuMRmARQNH5Q6eqC78zE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110123
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

On Mon, Nov 10, 2025 at 10:03:53PM -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in msm_disp_snapshot.h:
> 
> msm_disp_snapshot.h:53: warning: Function parameter or struct member
>  'blocks' not described in 'msm_disp_state'
> msm_disp_snapshot.h:69: warning: Function parameter or struct member
>  'node' not described in 'msm_disp_state_block'
> msm_disp_snapshot.h:69: warning: Excess struct member 'drm_dev' description
>  in 'msm_disp_state_block'
> msm_disp_snapshot.h:95: warning: No description found for return value
>  of 'msm_disp_snapshot_state_sync'
> msm_disp_snapshot.h:100: warning: bad line: 
> msm_disp_snapshot.h:117: warning: bad line: 
> msm_disp_snapshot.h:125: warning: bad line: 
> msm_disp_snapshot.h:142: warning: Excess function parameter 'name'
>  description in 'msm_disp_snapshot_add_block'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
