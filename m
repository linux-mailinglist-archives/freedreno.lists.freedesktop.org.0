Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D27B03DA6
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 13:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03DD10E473;
	Mon, 14 Jul 2025 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkMWYXjO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538F110E470
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 11:47:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA6WZR024162
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=t+wfd3CUH3K69uiY1tGZEAhA
 GJt8soTvX1/+0I7VnVs=; b=JkMWYXjOlBvqiFf+03FX+jypWYbZIIeNHqWAREUZ
 7GAQg95OBCdRh5NWLVMkxvpCVEhfu7uZHV/4+uvvWAYdmgrsXqxzWHEjTcsvUQ61
 XCqBr+Xcl+VK6yTRuCRzNqV7xvMPvpHtEMQKgWEWWyN1Stvr3KdN4vF+joaX6rq2
 3Wy5IKP1ICRfzUb2vOklys9VKGQ8x7rBnmFP7vq24yPK8sfhuyXvW70VdExF2Vih
 RFNv5d4h4u9dUAz16Sk2tMf1LkMiQydm5Tte4ILjWXO0vaEHDWElM8oxvau5Wc/p
 5twbQuk00Y3/UVYUmUp6oms66f3Lpk4xYxDGoR8ypLdTGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbcgsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 11:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e278d83457so157815485a.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 04:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752493666; x=1753098466;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+wfd3CUH3K69uiY1tGZEAhAGJt8soTvX1/+0I7VnVs=;
 b=mccKfoa+k5ZCuZgiKE3xYNa+Kx5mwJ88OUgmoiVkalydhVo7FXNFB3pfNYGzlYCqK8
 SFw0zgN+5CnVFNQugzvEzUiwJ1qbclxCOA8VgaiHfF/00NYfKADZ3WodfHQiFO/9w5O1
 ZuHahIWef/eosGKhqeBRFKzRydc+7OvMm+ifFRKxsuCn8SzWEwmqkFLOifX4fiyzaFqy
 38yCPAOBtWd+G0ps6ZOMb6PVdz5k30Nrt+xXVwVSsFehwa16WQoqThW9UiQQhtzt3WtT
 PntrO1b7G7U3SsCJemAWx2iy+ZphEcZbOy6DmyHQpnLaPuhmJtiarlQLQoUKz3bEUvQi
 Qf/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM4bfQJ+BjPCj+ww8hl2JRtoiA9H35YYpd7Zg+4AKQJM+moo1MbbeXYaotmDdS3ClD+ueCyDJXuU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGoKKsIIeTnAaTp2yii8TRR+8sKWHVsZsDWWmYorqqlr7mSvnm
 iNRlu0V/Yehgy3gzBldipVquUY9QcqwlvneJ9sbeH7pzFcrB/6X30PJslrjxhPa02rNehw4iLWZ
 0jYnEPgGWu7QrgEe5fFD0TZB26oNqLoagfcWGbvEihYQ/Q/xH5bey7+8IfmvHAnrdCL4cLYUb3h
 l37ac=
X-Gm-Gg: ASbGnctSP0KCu1/5jCEADVpDgQF0rq3xPeu7H3iNbXIB+m1Y4f53JsjrU4glpmaWCcK
 u9gsDfJ1XN6Cte11objZ+AXXv11Y6kY+wIunkkIxsWhiZA1TeaEJedqEoNmyQpYNbX/SzuyGnxH
 LuIj3wBnQGUY65vzy5gSFml4vgYNZimnTUlBSdh8859qTWTpmMq4qn+ScqJ8jyNqDxGwwOC492Z
 fsmbyS5fluY9LLTp2sxnFrODkRt4N8WsF6OWOInHNEbW/d7YvsiMTCVcw1XvKu9jLz7zfXqh63Z
 TGSEdkc+xNvqjHg1GyDCL+HbCKJBJ3FCJiDsE9i1TxPXZtUSo+oBP2p1gHicskH0VZVsPOsAshB
 CLwygZ8p/1xmUtZwdo5z18qB6rAYkeco4iM9LVmAwFEzaDAi/Buxf
X-Received: by 2002:a05:620a:29c3:b0:7d4:492a:31fe with SMTP id
 af79cd13be357-7ddecd1299dmr1929538385a.52.1752493666374; 
 Mon, 14 Jul 2025 04:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFfkjooggnntqRT1oZT9zE2pntAHLG38aK4mLosHKhsfcoHd1ko+GskvVDqiEDmcSqtpj19g==
X-Received: by 2002:a05:620a:29c3:b0:7d4:492a:31fe with SMTP id
 af79cd13be357-7ddecd1299dmr1929533985a.52.1752493665811; 
 Mon, 14 Jul 2025 04:47:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d2f89sm1916017e87.115.2025.07.14.04.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 04:47:44 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:47:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 03/19] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
Message-ID: <mw6wrx3nsiantc2sweio2xbgrranoglzugaykjo3robkknrlzj@5dma4fm57xut>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2OSBTYWx0ZWRfXwpE7DdDU0UK5
 /ZFcBkOOdqJBXNzNfXekopxUPab4XXPceyI/4sB0w6xXzhFF25sO+Xxkp0HveHdDjasUUABkZ0c
 eX8gPJLs3mo4sU7qsrmpS7QHSJlw3Toj2fm47Z5n+ypoJm4mw2BLaN8L63E2u2M9SEZgZWDx84W
 k/hRo+t1FpVYkbeOAHC+6GZ+7ewtIXhrPK0dILO/2m47psnhuSwwGnvyuHIhKsI3Ss2UtjD+HvI
 shwjsQHUmfJ+7o2h9S/WCMRZE/QxudB2y95br0Y4MSVJa2/0fysPsbCLfRfRuRmKS7YA18UxA9w
 PvJw1wIXlX4vHhpWUysfjW9csE+c8POe5JnEKJWDd/T8t8fIKgSjbgaK9fE8y7G/wDB2NUsvgpc
 3qwBnb4MB1Hz9RA9ljrQP+CtUuHTg6F/ZjjeuSF/KyT5d1kxczDKIswN0tmACGIWEYSmwC2g
X-Proofpoint-GUID: qUGnC-8QT3dZrMc9SsE_n9CWdE33gYrH
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874ee63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bA0M61isIPtxKdXERIwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qUGnC-8QT3dZrMc9SsE_n9CWdE33gYrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140069
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

On Fri, Jul 11, 2025 at 05:58:08PM -0700, Jessica Zhang wrote:
> Replace the ST_MAINLINK_READY check here with a check for if the cable
> is not connected.
> 
> Since atomic_check() fails if the link isn't ready, we technically don't
> need a check against ST_MAINLINK_READY. The hpd_state should also never
> really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
> twice in a row without an atomic_enable() in between.

There is something wrong in the last sentence.

> 
> That being said, it is possible for the cable to be disconnected after
> atomic_check() but before atomic_enable(). So let's change this check to
> guard against msm_dp::connected instead.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1072b5fc00ae..fe38ea868eda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1606,7 +1606,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	hpd_state = msm_dp_display->hpd_state;
> -	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
> +	if (!dp->connected) {
>  		mutex_unlock(&msm_dp_display->event_mutex);
>  		return;
>  	}
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
