Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8CFB0A97B
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 19:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB3210EA27;
	Fri, 18 Jul 2025 17:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL3fYOQC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD17210EA26
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEaitt030397
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m3LoWx9DJ0TyeqCc/zXgNGefaOcySK/itM7vHhC503E=; b=hL3fYOQCMSzfdzZe
 ARYdewThhNQpHTxU9N5K5FEGaVx+b6EyURyjSKgeEY05Surk9walCPC6uH3da5kM
 moiRe8ECpMYOhbwKNv2N5EZQP99VZA8OMHEFDTFQkoM6/eThJPecHLpCq6DZWWt7
 zLe7E9CkPzejy4CdqKdIifKZEA6CUdob6+dbeWyHbNUXJyxyzuRpmYtrYWX8XYnx
 Jmv9Zq/6pNmnNLa2Tug6NgWZTA+7oXWZn90cUMOOkoFhaz8iYAL1xILGlbSG6zMQ
 vjuQwEXALfkTvBftllkkaBt9BreiI61wcEFH6BvwLbyNUl7JPgYwRBEnUJgifCGx
 XJbQ8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7s937-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7ceb5b5140eso385228085a.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 10:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859705; x=1753464505;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3LoWx9DJ0TyeqCc/zXgNGefaOcySK/itM7vHhC503E=;
 b=iQ70ZXojTTj6KrFBPfKPQFNAHYgGVn0Sx+HCffMF459x3bWPiDYTccM1Qa6ZgkTU8Z
 scwM8qrRbjFq77g9cM7ZLl4Q6oVAmqfY8SeMI2XTW7T/gZLreySb+dDS/Geqa8cw/nFm
 E+Ob4Uh2dYHu202BP7NXRYTflM0/P3gZel3Cu0EvKUdrtFgL7AKJeMlS4XECrtA4x14S
 ElEC6YF4LbF4JGzjDzzUPYPwOY2ovEO4kaEMQHI139lHgDoYVq+4S8Ub7tecjdr3TC+u
 NqReu2yZNQ7qPd4KOh60DW6FebhpvahGNenjMyrhjKpczsiU3qLXir8sO1kj5oWjVo4I
 ThhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSC4LrUTEgd+Vwopi/Z6RA3EaV7QQlHNDMF3/u+jtBhngpFUnDoyUePeBrlO+euJJciOmvI9R482E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpoTSOnjWJUHeONWJ55HN9RcBa55MMMECzVLmtzP4Jx1jPvXkS
 wtqMVGp3Ls2eV09QZLvG9qh3ZJbfHtuD4onUX3PogG1NiWiq80CMjocAqn61BBLQNE9petLPIuZ
 b1wMcir8YjO499j1+nWLNOFeE56ushTHzYVh2cwGe7ARBEZTSDfRqrcWSRnDC3tJDfrahAsY=
X-Gm-Gg: ASbGncuCXCBZXYERg3Zv+eOtBOiGOQw58w3skMPBUX4xZRmlsJXrrHvoHJl97l1FowN
 WrnCY5RpuLNQZjcBtJreuNmQQhyXRBPVbuBnhdV4mc9KysEY7R3no9kdwqu+xLDPhawcYGELCME
 LE3f5Tvv9RatPUaXv2zOmkA179KFGbaO9/1ipnV0g8izV0BUarRjaxHK1xHhCmkokxqFaq+hKmW
 6JM6zjA0zsfCPAKTSmxmxYSRZp1cWx84btATqFySQF5TQxjJDGxZHnuxek3PoRqWK9FaZxsCpTW
 nP50Mtou549FY3MNJe5aCPBhbVNfpFYJyRn/FFEoOde1ohpKo5IX6ZTusB51j9tF3ZQUEWdFMuK
 mpnMDhpjG9QFfO/CnZZ5Br9zPNLAhV7SKiBXlA3eyHqhRck8cAxv5
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr1705213685a.14.1752859704674; 
 Fri, 18 Jul 2025 10:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi1fx7XAxIa0TvF/aFCXfwm8ex0+eb4Ytu8ukrsy0ujfZiAFNB/UKSTVvQ3I4n6jhoSky01Q==
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr1705206985a.14.1752859703989; 
 Fri, 18 Jul 2025 10:28:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b71esm334910e87.30.2025.07.18.10.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:28:23 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Don't use %pK through printk
Message-ID: <kb7m3ybmvpt6ywbzawjeqzzxpinc2k7b5hgm5333gay557hxrv@swg4dz4sh7ft>
References: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX5DKj2ORleChl
 B0dfL9MBIJi1Yj3Tf3g+GWDGEzTVF5ltIJNwLPIZEIeyc9k01JfvlIqSekx7YRLMy/pDz9L1OuV
 loZhsOGojDq4OPe+/OmwGlXw9ksilxvICYWR7HN5VbCOcAdTVDuTk8FODcKwsBrR5CvyUcA5SLY
 IikVL/VbnsQe5uO112dFUE+QwwDb+FAruoTwp6AZGTszyqNLbMsdXpSLeW710h0IKlKgNJWc5A/
 RJDDWCxuFDFfAQjTtU+dnjOdKUDaKvVNAGKZSH9PAmOiU5PQRGr8+LISEEIopTu3miBR0xXrIYn
 omIutZvVZi8FRcPbrySFG4A3H4XmO5XvI/65MzR8dtFKssp2aS7yxXCO+qrP4gGlt4i9+6MKIPl
 UfuHTchqiVQkLD2W8xJPQ9sFtH5cyVgn1C5qkfxnQ4J3SUSC9BvhRXirTyrSGZ4Lab+VgNXB
X-Proofpoint-GUID: XSgibqAM6jR6oGSOz3pQl1ErOfvpoK9x
X-Proofpoint-ORIG-GUID: XSgibqAM6jR6oGSOz3pQl1ErOfvpoK9x
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a8439 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FzZ3ZiyTMWqXPo3om_sA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=964 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138
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

On Fri, Jul 18, 2025 at 03:27:37PM +0200, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Drop already applied patches
> - Link to v1: https://lore.kernel.org/r/20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 4 ++--
>  drivers/gpu/drm/msm/msm_mdss.c              | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
