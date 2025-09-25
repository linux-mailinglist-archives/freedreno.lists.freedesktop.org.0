Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36CBA1BBD
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 00:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B4D10E9BF;
	Thu, 25 Sep 2025 22:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ru+UCULM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ADD10E9BF
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQIsI012446
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j9jhbfMWZLDlbLvHbgzYA6UULoA9b5J9ED0wfYv3EO0=; b=Ru+UCULM1uxxF5QY
 PDVRfUOSeKE72n7qUtoocVn/0tyOHj9fRxaGgSbk4rZ86lGWt9+5WJV3rXB/XAbk
 Nk6bozdWhGvHx0Alt95icca7C4ODdW6591lIlQwg4zah3Y8PkwsS+REDlYL1zBAe
 2gOrehMmLyv7U38Wfbm9R8LCx5/ND/Y6XkT4RJeQqwV7AbA722xoHEOmcLu2753F
 Nol86Xr6VgkCSY8g6wRCC4YiL5ew8OzzVnoTl3tmbcS5yNVcDpndvJyF8cgGJ3cU
 xwkQtuv0JPsB82pmqxoLoU1xI3mT081BHe1N+3n3T3xolTJ+cVNW7OaU1LKMbL37
 xxt8PA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0h2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:04:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8544316ef6aso563803985a.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 15:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837859; x=1759442659;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j9jhbfMWZLDlbLvHbgzYA6UULoA9b5J9ED0wfYv3EO0=;
 b=pNWaxzzJVladAQdjc2lTBpVZ69CQwg/t6gdRMv1Q7Q/6PVclnKYqWuYAm4uAfPxL/a
 Y4rBl8E7XP+wBmlUFAumiJc9Jpa53FVYcluCKoAvjpX3WzqhN/x24J59HWmoM5Odx6fH
 udH5iB9o+uRd2a7sz897GTe9nW987P0A3TLPmGhy/BrKtGMHRmpKAwQJxhJi7Cxuz50Q
 40lIrozUnjodlrzLXqJZ/aCPHChx7TiOXCXPO5v7fsRGhL+Q0wKEKHmVLjqVTFJHfO4J
 SuWLmTlnxr2/804zImEpZhQ3+q4uT0/xZnex+JZfiyflxCZZyWi0FxuNqV2+TN+F8fau
 Z+4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU099pfXGMBS3e7c3x4qSFvXGcwxk+eYQ1pNN+O2d2xq6dmMBiuwyjOPDgwiljjKzpEuzBReGp9IMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP874kLpEPXFuebZ6rfFAYGmrUEnfxrlFWykoZ9ZobBKWl/M3q
 /lantZwXgM3Fo1GrYPWx7pjgbC1/DoAXvZEgko91EbWhoZY+b1Al/vxmGowhPD68VPWE5dNDKZi
 1gaoJ9I6oPwEYFFxMvAyCdh2AlfgpV+/UpHu8CmSkmE9xhlni23AimrE3UHU5v9aKrJZyu60=
X-Gm-Gg: ASbGncuqkbZnX/+XS+aD5USIukGkrw+a6gQ7Eq8LJgMg6u2mLRnYdL63qfQy0DqX5S1
 oO9tijtZ1Xghvuw9ZgIZyBOw+B5S7yOPfAEtgPrjDlf5xmQblMETYx6aZze3f/fYMo/3dT9LpyE
 X8Ud5o+BXgZQgTVC8P58U2qamxOiFRrbjDhGN2WvhbH66ahJZnstJMqiJG5hSzw1uQ4WKz45kPk
 pn2vW0fiWA7x2Q4BR3tK0KIA+gePrNoLVCRDMhzcbWowQadlPNPIWxw0tw/yZ2UqKxejPUKZB82
 n6hn9Vr1ARsDlhq4Heyi8GO9BHcNEW8UlwrapJbC3s4770SxZMogf33pSRHcyI7wvm+5wSsaUIm
 GVGOorJHSEX7wgBpUjNZUsL3obI3oSJsUNvFLvv+rlZv+Tbfmglw1
X-Received: by 2002:a05:620a:4890:b0:84a:d990:a6d8 with SMTP id
 af79cd13be357-85aea5ff6a0mr735531385a.49.1758837859141; 
 Thu, 25 Sep 2025 15:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxdA6dS4wu8OVd+3ocLVo0gkXNYMpAtVMslmaMzvNNUlBIIxaIcvu9v3eIlSDmgpeHrfAggw==
X-Received: by 2002:a05:620a:4890:b0:84a:d990:a6d8 with SMTP id
 af79cd13be357-85aea5ff6a0mr735525385a.49.1758837858668; 
 Thu, 25 Sep 2025 15:04:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb528984csm8078481fa.30.2025.09.25.15.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:04:16 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:04:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <vqiizai33y53o3h6ovhilcco5yyssfqwqrqnccskqoye23bf2o@rtob2tooaqr3>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
 <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
 <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: HaUM8dgjgQasoLeeJQN4wogeFTu8Ly3O
X-Proofpoint-GUID: HaUM8dgjgQasoLeeJQN4wogeFTu8Ly3O
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d5bc64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=TPbfgU9MJehzMSnRnG4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX5bRl22MSMOOn
 e+NwqQtsAYaD63u7jPCfflhK4bj1XBfKDK/qIc8qvkKWTesnXSEmIBuR4Vd16QuEM2ka137SiDA
 2j+Rr0wJrYLxR/+VSURuzt5HIITUzMxUFYa1OMgOH6Q09UDUuj6laMgw4zECHtL9vGoytmGcqN8
 dqSnpCHatotpmpg1XFehaUPi6FKp5OHUCLj4ngbiwf7TqiMJqlxb123dVIfWocFHTRvxmGeeWUi
 mL/8iPCUUX/Q3WhHjJW6QSN8KlKmSow2O+jiVaXkgJqCwoWQc2hUHRmj940CQb2duZg4La7p2Mg
 g4g+ua2KcYG6digcR0Mplb2YEGVII7AV/t3Dn9yaIudP5yz5inkCgleLaoilaKEvgoSV33CluSw
 PW2BzT5wLEiSP851kxbdL0C/4M9DFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:10:35PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月25日周四 02:02写道：
> >
> > On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Some devices treat two independent physical DSI panels as a single
> > > logical panel from the CRTC's perspective. However, two separate DSI
> > > hosts are still required to drive the panels individually.
> > >
> > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > allows a panel driver to inform the DSI host that it is part of a
> > > dual-panel setup, enabling the host to coordinate both physical
> > > displays as one.
> >
> > How is it being set?
> 
> This is set by panel driver in probe(). You mean this should be documented
> here, right?

Yes.

> 
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/drm_mipi_dsi.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > > index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
> > > --- a/include/drm/drm_mipi_dsi.h
> > > +++ b/include/drm/drm_mipi_dsi.h
> > > @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
> > >   * @host: DSI host for this peripheral
> > >   * @dev: driver model device node for this peripheral
> > >   * @attached: the DSI device has been successfully attached
> > > + * @dual_panel: the DSI device is one instance of dual panel
> > >   * @name: DSI peripheral chip type
> > >   * @channel: virtual channel assigned to the peripheral
> > >   * @format: pixel format for video mode
> > > @@ -188,6 +189,7 @@ struct mipi_dsi_device {
> > >         struct mipi_dsi_host *host;
> > >         struct device dev;
> > >         bool attached;
> > > +       bool dual_panel;
> > >
> > >         char name[DSI_DEV_NAME_SIZE];
> > >         unsigned int channel;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
