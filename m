Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F262BBBD909
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE44810E30F;
	Mon,  6 Oct 2025 10:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ588+Dh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318010E30B
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:02:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5962AxjS019973
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=emQk5agLRXov7YwB97bnLlbt
 YdyYufIKmyT5dEhdxvU=; b=NQ588+DhRqmfTiF2po3K/IQCh5QcODgFSvxnOvBp
 4IISFD1OSztW8A4BXSxomjt6lKNuAuIrgETuEccYBJiGkLbBD/+vpXn3HnJBouq/
 11uOdZBU54oF+T2EkFKyXVB9KTyss/9HzypZL4NBO2yAC6KW1nHXuPVn2LXLfrRu
 QvZOqBF+jHfqS8kef/+h/M/4Bcpc+sk7YVPid2VHlvJ/lKd20BZPrlDFesXksqkg
 maU7rkwjWUEdd2bFJt7Qu06mOsw0TFZSUmT5AMwGtqq9Gwt6LBlpO9ef24MRkw0K
 ayPvSENTdF5Nv/QprYP4tUt+oRnrzvIztSA+5Ln2g/bgEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3rs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:02:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d91b91b6f8so55695971cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759744950; x=1760349750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emQk5agLRXov7YwB97bnLlbtYdyYufIKmyT5dEhdxvU=;
 b=EbQ9grpEQYst+Kr17Km67SC0qaq6LGnwDpEDf9ywMLZznfUCWQbYWJ/VsKhgcIL8WX
 rAISNB3lez2Q4Mz9vASlh4AtLNRHc73W3wWr1Im1rgAxx1jBlw5c1rnE71mbK+4V5L2u
 OUMIWl/Fe0F9J1DtMWelBbyKqbElqgBjuZSLMLqFzuvTxd296mJNvLvStanUMsa/5SNc
 sjtpTgbHLTIe5uWX/6gNXBp2tdKhmYa7GjdKt2BQRzLTNH5Jshay/S/AWk6GfLKNggcq
 1g5V2q4tTFpt7oXH9T+d2zsOK6mjhCAVpf1k3E9Vzm6x4i2WlV7Xi+p+L/MUGkJxDnQ6
 baBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdcBijkBADMtOK94XWOzkDtSD9B5o8XSBbQWPVF5Hvmc2QF4sBDq6XdVMEqK0CAfnvAHVSCrMJjZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt9vGV3hLtJuSn7Rruk/jm/lTBOUmYmAWuBonN5SBkbw8jMCDP
 Hp2QseeitUWg3TtVlKiG8fcg52cc+yRxOMiDMABx7kQi8gu5bjRslLIf86/h6tCf/lyWt7nZmSi
 5G4IiXihdoWbl6Tp5SnidU5OkU0MsGJMgYKDZUgqzcFNCEuJtX1tWpzrBUoDaKw9qWsppDRs=
X-Gm-Gg: ASbGncu+PXzy82PByecg7YJ+WVnGcm+Vd7rv9i6Y1WtubNOmyOv8Zy06/+rGVz5sA/4
 FeI4VQumkvMLgj5vwywrSrbjbnG3zo/gIMDZ2sHGhI33xLmF3alfzd2dvU1SPk8DlYBZvgXDIRg
 wKJ32EO5GcuSdnkF753WKWSqS9L5ECCeuYwGCDLThKPvW5mAwd9dDY+jeHJPnue40X4GVJAa/HD
 XZgMSTbpQyirUuXdW1RBsm7+do6neDs+Nqc8vSsFiG9HJov1LURyctmT/Q9pRdlz0V4KoM4rQY+
 LJ/n7w4o/9ubOQaTf4bhUy9lgxXl/O6z2Pl97DvBBTVa6b4ZcQfOAkqg4Zc4HkEXHoZC0e45lic
 emgDJMkpmGLSotx4CqO/lTLqz9GaPLHSlcjsuphCxQj8WcIZjvm30lHY5Rw==
X-Received: by 2002:a05:622a:909:b0:4d2:a1a7:214a with SMTP id
 d75a77b69052e-4e576adad30mr157836251cf.45.1759744949568; 
 Mon, 06 Oct 2025 03:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy/JDsMXdS7AYgrpeJ5Yyjg3ZDELYIlzxigHOiHIhaIjrnMXpioVVArym3UE6bvb/Dvdh7bQ==
X-Received: by 2002:a05:622a:909:b0:4d2:a1a7:214a with SMTP id
 d75a77b69052e-4e576adad30mr157835651cf.45.1759744949077; 
 Mon, 06 Oct 2025 03:02:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0113490dsm4901255e87.32.2025.10.06.03.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:02:26 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:02:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX+LV1gXzRRxgg
 jHzV6voItxWQBA7WX6gCp7d8wAjBFb+MYEKCc9jWV8qdD2zbCbiYjrspgp9SaFMCQVifNsuWk3q
 ejDMNvkrCL+xpBpVwtb0iqs8V2YdwR+G8xb8htFE0gzmml8fi3kbdUusdUwiYc6h7YjFXjsPk3+
 jXu+8QfG+MvP9WRTtY65TNxELrxDrDvKLBjcqHpm80VtANxbs4ZTQKbQaUB8jlSJA2yY/L3CBzK
 QLM7P9zpKs50/xTW6WzMkylEnbyV309JoPdlSDayhAoy4lvoNidwGGHQV7+4jieyqnfo5+6E9Q4
 e6w7pDK9F5o1ktGhf/RKb/nGDPHDB5zgH/VCwcBYW+2zbiqEnkoV1gfSK8QCxcIJaIZ/3Pq92dP
 NiEFo+LZU34Dm3+kRMrUcqsOav6i2w==
X-Proofpoint-GUID: KiN2u7QUgUEg73hv_1rbgiiX1rOzJjHm
X-Proofpoint-ORIG-GUID: KiN2u7QUgUEg73hv_1rbgiiX1rOzJjHm
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e393b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=8BRzra-YsWo1JaVNFEUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
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

On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> > On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> >> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> >> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> >> tablets.
> >>
> >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> >> ---
> >>  MAINTAINERS                                   |   7 +
> >>  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
> >>  4 files changed, 455 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> >>
> >> +
> >> +static const struct panel_info csot_panel_info = {
> >> +	.width_mm = 250,
> >> +	.height_mm = 177,
> >> +	.lanes = 4,
> >> +	.format = MIPI_DSI_FMT_RGB888,
> >> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> >> +		      MIPI_DSI_MODE_LPM,
> >> +	.display_mode = csot_display_mode,
> >> +	.dsc_slice_per_pkt = 2,
> > 
> > As this is not a part of the standard, what if the DSI host doesn't
> > support this feature?
> 
> Shouldn't the core gracefully throw something like an -EINVAL?

There is no 'core' here. Each DSI DRM host manages DSC on their own.

-- 
With best wishes
Dmitry
