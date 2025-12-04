Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3267CA3115
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 10:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF2B10E904;
	Thu,  4 Dec 2025 09:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgAp/swa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h50MFfVg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F6110E904
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 09:46:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468pZT560269
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 09:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7Z/HfXyX0h3h8yE4qzxHIWyVY2HabPVYbfFHG1no/2M=; b=QgAp/swaJ0IDrkam
 xgFJVbyHR+m2S39k2olMMZEB7mKImEqRUh1FsllKFWMlaG3pksXDXclIbHnuwmC7
 5KRoMaekP6Dl9KUrxBPFtugJsiuDBtaBlKyUKlOgh0BGcJK9/0fdpsl3fdjOw7x1
 WUvv1R3/jcXa+USJazKQrfEW/zB/O8Hm6MKl8JNcXjwpJYwlQhu9XZMNOe3fZLHl
 RBiz32hL0Ax51A1JhqVwSPWX3VybRQFjO5wOUJCFo8jW6CptS+A5agK/vYLpX6CR
 0kUy6rlyfNquRCHCWH84taqraO6OOfhgwvMWYeGyTjQRKiEXfGPZr4LkRx8ZqirH
 hnv0pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmhadux-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 09:46:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b30b6abb7bso145983285a.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764841607; x=1765446407;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Z/HfXyX0h3h8yE4qzxHIWyVY2HabPVYbfFHG1no/2M=;
 b=h50MFfVgaJ4V9du5EtVv8O8Yi/Fjp/LW+iU1E94hjixS1Rg+nhi/rho1XtQP0qAxJO
 AlrouDoh1Yz168/VqzBtpt+4usbyCXUBkmA1LCz+N1F401NXIZZ1035Z8BgdiU7X6TYH
 CCaTgnC5zUmSi6ecAPMzC+8RiTabB8sx23AHIy/M9+fNd4GHqccrm+WEYdZW4/ss5Xvy
 gistXBKRRGHX7nIfo6ct27WslRG6IysgN6CloJ/Daw5PMBkixsVYBn2+Pv17ucNbOKPc
 qCDlEbUTNtA4O0a+emM6e//L7KYeVtSahN15/6vwv1t8kK1j1ePt3eta27okyduIuWST
 5VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764841607; x=1765446407;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Z/HfXyX0h3h8yE4qzxHIWyVY2HabPVYbfFHG1no/2M=;
 b=e7QyvS7M7ltbJ7k3NkAISIJyiKoE12jZGR2dtl77VgyJUD1IW+DT72jg9z/1++feQI
 CwXqlRoyVEIccxuuFeT2JNp9zlG+xCpRPVIn8o9UitjeYlNkbr4j/vDw8OLwI5jzKZou
 aTT2SLHfuN+McFyc/1bhc8ZfC9T3USgF5Y4wiOxd0jtO0YybnCYFITww1WQ+st8HCDhG
 X+uKezpfpiriPoIpL3ENU4M/RlFBTp+XkPkynZ3Hseq87yAHZiX2Af/bSuMrIcjHvtAs
 CG2wqB+W8RNzeId5yLAAu0L29uS56AxAMpZOG71xEvzVbwWWYYKwtmbI7UKVFz4E0a7M
 Qs1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWptPMO3R5biRki8Ci+bnuR97ORuIuvYEZUzXUtYfl2uBXHj/s1p9ljP17aHx8LeLEFgWlxcruzGjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcpWnAzTK5GVge+bXHcil6sbHa+fMCicJG8jPYlg8TNfo3ih+B
 ijp3Iu3EwgGYwBdl8pJz4CMg2tnGPEHbBFOVMdETj4lJ6N7BYn+qg2ziaqoJVu1E4caASC6u6ic
 Z0zq+NUsQK1jy/6f77VyGlvj6vmMRm5bTRIjO+C3kEM/Qat+ZARTMv7h2+zaNipiSKRjwCsk=
X-Gm-Gg: ASbGncsvw98UOHoldLY2a3sBi5MGyRQ+bbKLJTwcAygOdJ+D1+OZh0JxvFjXOMS/bWl
 3elnrmikOVsp2kXyhKSr1LCVkV4asY8iclFOFA8EU153Stwyt79WDlAI1zIT27InxoG61Ew/ZnD
 4cMuX5MWNTG4EhzRpJ1QSQdW6hEujXg6Gs2wRDCmO6zZPl2BJt+1Clk4Dc/WNLTdzHIidkJiOXK
 gkcr2WBF48ZY1HaEgOYRBZCnk2urJVtaR4G3nflaQfn5104n5Qrd83iyjrJQ8CcTBDyal3c81f3
 Ak1GcbBz+Tkftf3tLpA8aBaGo/ifwJ00AeWsKaValq2Fdr7BsiKOzc/XaZcCdh5FJZXRpoqtwms
 yRaRsxKU9YUkqRI6xOsajoOWUk/zgrtwigwk6NRf4FwQNbs31UipJuIW45mxYk9QgcHE1DKaans
 I9Vlq7vdiXDUjeZoXUPN23v7Q=
X-Received: by 2002:a05:620a:46a9:b0:8b2:eae0:bc02 with SMTP id
 af79cd13be357-8b5e77339bfmr840433485a.88.1764841607437; 
 Thu, 04 Dec 2025 01:46:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdzqWVxp5iXvWLw/Xt83XL2+yu0WboXvnBGeW5ESLenPupRJ5hZEkM33PPmCIfET4k+FdNPg==
X-Received: by 2002:a05:620a:46a9:b0:8b2:eae0:bc02 with SMTP id
 af79cd13be357-8b5e77339bfmr840429685a.88.1764841606828; 
 Thu, 04 Dec 2025 01:46:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b2495dsm344869e87.38.2025.12.04.01.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:46:46 -0800 (PST)
Date: Thu, 4 Dec 2025 11:46:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 5/8] drm/msm/dp: Add dpcd link_rate quirk for Surface
 Pro 11 OLED
Message-ID: <i46ywpjpe5ujrokpssqwaf2hcu4lwm5k3t3okyk25rfor3mhfj@hxl7zmpdgzte>
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-6-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201011457.17422-6-daleyo@gmail.com>
X-Proofpoint-GUID: RCC6WYZxnJbtx6OqULJ0IiM7dJMxmLcW
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=69315888 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=6PeS3r3LZKgS9momG3EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OSBTYWx0ZWRfXw3YzMoCzCLIq
 HeVjP1q+R5x71dUsBAfmrhv5zRoVzY05UXppa4fW7a+KSLyf/DA43opnC8sldxD1rh028ZEVDZ7
 Dem0ZQ3VXgfAV+8F3mTMYcNV+79SZCI1Anpgi90AhEhlOsNgqfWXeEZS2p2CShnPGsixx0odw83
 g5b1cQ4vRcmjLyYFJHTMOM4ofLSy00xyN5RZKp9QbgqzzxcWyvaeH11oohsAZzKeYCjlE4Df4tl
 r/Dg1Pr/F473u+rVggq/KvtDPcr14pntpI/qlU+awUhYxN8MIbSiOiadMmwFgVQVrBjdc8v3eCI
 oUXTyZusH/2nXhMLm2RrEUYJSezpFEixyfAtErv0r9kbhjcL9QudpQiGm166BmuBOd+7GXV/RBT
 BVwWqsK+JC8H7Ig9n8yXH5ENSsCbjw==
X-Proofpoint-ORIG-GUID: RCC6WYZxnJbtx6OqULJ0IiM7dJMxmLcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040079
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

On Mon, Dec 01, 2025 at 01:14:46AM +0000, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> The Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 (Denali)
> reports a max link rate value of 0 in the DPCD register, causing the
> panel to fail to probe.
> 
> Add a quirk for this panel during DPCD read to set the max link rate
> to 8.1Gbps (HBR3), which is the expected value as reported by the
> "EDPOverrideDPCDCaps" block found in the DSDT (0x1E).
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: Dale Whinham <daleyo@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c       | 14 ++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  7 +++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 4aaeae4fa03c..a533fbb2988d 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2543,6 +2543,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>  	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>  	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
> +	/* Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 reports a DP_MAX_LINK_RATE of 0 */
> +	{ OUI(0xBA, 0x41, 0x59), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS) },

NAK, DP_MAX_LINK_RATE = 0 is a part of the eDP standard. The driver
should use alternative method (Link Rate Table) to identify supported
link rates.

>  };
>  
>  #undef OUI

-- 
With best wishes
Dmitry
