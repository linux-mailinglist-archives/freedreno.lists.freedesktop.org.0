Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4727B183B3
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 16:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2EA10E885;
	Fri,  1 Aug 2025 14:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mv0TcpOl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C8810E885
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 14:26:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571DF3gl009776
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 14:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EzvS1jMX5x8+R7F+NrDMwwT/fTPAvaYvo4kcmEWAh8w=; b=Mv0TcpOlW2B6528l
 q1fFdZ1HJ+9on7dRfi5X4/XNaFJsntPIpJbuj0G2513OWO2znFSjc+t6b7uC9o+1
 VgWUXg9WvZZN5zxQjlg0gTcchFScz8cc50Dt+K6fXBUL1DWQe8SaQzTWZTus0YGi
 R1qWeSYfHYHAirPrNlyE6VVp6RxqURJjpo+oKRp/rQI96e9dbpAuX212NleLRLP5
 KXuCWlVaCRpuW7bOfFIIHcqS23A7Ustp4WgBL7ut775P+EUW7F2W4DKjVJkigvXW
 OJMvoAuo1MT8bBv4Kw507RcOT9yjfguAMhUasvajj88LiKLnUvZGs+PziHVdqQCW
 1r5ToA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488q7xsncb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 14:26:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-4fc078d2103so2458148137.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 07:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754058372; x=1754663172;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EzvS1jMX5x8+R7F+NrDMwwT/fTPAvaYvo4kcmEWAh8w=;
 b=lWPhcKWZHe/oOZ8H6DJrO266jFlf5uGtkztLVhs+sVxk9Ddec0x1X2zy5B29HepJc3
 37ZqpwRxOqdVOEet2Kc2GdpBRZBqrQ4zrZUOsb+WQZB9Wv84mcLFfi9LaCbdVC1k4tLW
 60ao2OdkPEe08j0318eHo6peLHGL3ONMLQPW2OEYZ9gppasNSpciKIJvZD8/IowfM/Xt
 h99XmwKEXkDVdhtKoD3mm3awV5MY03n/AWIHBk26tAD6XfHpqoRMJB3jF71QKjTenXPc
 lgHX7JWI+dpzyMXYuMtP1+0sHva/En2n8i2EogHAR0e+7BSlb6l1GusgOc/chDvVsZfz
 E7lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrdFxNxXPxRHsAlHYm6FMUMDu5HELi+OUDkIG9l11oPJTpJs5nPYw2/S3cGKEvXsUy5cbQHfxgj3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCqN/oNRIfpTwJzoiWdjl1+v5Bvjn4gxpIp8M++yzG3XMzorCD
 mo5aq8dsPpKJTvOSKcTHfJiUXuxLDuExuIcBglTQvNnzg0yTMZXd7ALbxgcj+54zskZH6RIW36G
 sMm6lR9oKimNlbRAyRTiFQG/4A+fPviki7NORVRACN/i7F8gx+PjM7fPbXaed+ziowe2Y42Y=
X-Gm-Gg: ASbGnctZe35Dz2NXkGtbdbqNkOxZiupPLCfixvpb4KLfe6LPWkMOw4H1eNGWhxgW63Q
 KYsDvdj3o9npXcfBCUGc9pspn8G0i+o+1b7JnNk6JqIJGhkww+b86bJGw0kMOxvJVtVZD+a+e2P
 9p+lBwdCIGhg4NcyPsvVSRwL2PJDgsh81wSce4w35DQZxjK5HTeQQLia3u4NeOitSSKjZ1wOAH3
 FRSIuRxvK7EQsiqtZxoLYkjosKbPV5xGfUP6ds0NRGA2yq9z4uccQ04xJQCOtl2OTTqPZlu7Mfm
 DBLQhPeVzmxVGHi5mRZa7F1SjJUL7bHcOZboSRFSfasIGw+7p9TdZ+oysry0QlourHTdgfBjC8p
 UndPdyKfRIY5Rf1Tv/AijgzVhC2oEuTJZo1+KjDUqtk4Yz8mBfs+KslTCU4mj6I/GlKCF2s33LD
 l4RZB4++mJJsm/umFv8q4i3Q==
X-Received: by 2002:a05:6102:3ca3:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-4fbe7eede93mr8246360137.5.1754058371990; 
 Fri, 01 Aug 2025 07:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtV8DSsj9RYUgiFZC2c162wgAzqi/wUqPBz85jhmoN0PI6WRYnMuJqyzF2EbQRO88PjZQP5g==
X-Received: by 2002:a05:6102:3ca3:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-4fbe7eede93mr8246299137.5.1754058371520; 
 Fri, 01 Aug 2025 07:26:11 -0700 (PDT)
Received: from ?IPV6:2001:14bb:11f:12ba:7035:8684:db73:a472?
 (2001-14bb-11f-12ba-7035-8684-db73-a472.rev.dnainternet.fi.
 [2001:14bb:11f:12ba:7035:8684:db73:a472])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238272f35sm6403761fa.3.2025.08.01.07.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 07:26:10 -0700 (PDT)
Message-ID: <7ea6294d-1958-4586-975b-beb3e5114a4b@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 17:26:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
 <b92e89d2-5bd8-4228-872e-6e5ae9b4b054@bootlin.com>
 <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EqPSrTcA c=1 sm=1 tr=0 ts=688cce85 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=CdbOqKgfPjM6tkZZvDYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: CC1CG5eM38fMAS3_RUVP5t2y20J5QKsY
X-Proofpoint-GUID: CC1CG5eM38fMAS3_RUVP5t2y20J5QKsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwOSBTYWx0ZWRfX2doQHC7q/XA9
 ic0tZoBI6RyZJfb856Jm+pVS0KbDQ9TCf+IsBiCRav0zMjD0XBww8ijZaLgBE8S9DuhzjgjMvuS
 81iUnYArfu2ViP+BZU41rSuO/9fyAgcm5zzJYW74XOVbKfqmQFjrdLqC9P/L6YJIgWj8zYz4wDM
 nZdj1cDP/sw6rV0KI0uech+BL2tMUpfbfmBcP1rZmPbWe4TMR7hGsr/12qULjjt5WvAxdINs5IO
 NIUVXPdaRUCEKOT52U3jkJbcLwRJq85kzt2+HGjO3e4FI6OxYoJQebRtB8ZYYJBuBYKzi7o134Y
 Y+C5avS1N3jXx5U+y82LPK7cVjcDV+wPVjA+dfdmYRfd4S1jwuAV9aT0but1xvptwmkdPOrPWeM
 VzHnbyHsuInsxvHO5yUHF1k7q+jaU1Vl7jnJk6rOjSFAGShGgn3m0ax0ZStRidi+koGNp89O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010109
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

On 01/08/2025 17:22, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH 7/8] drm: writeback: drop excess connector initialization
>> functions
> 
> This should be drm/writeback

No:

$ git log --oneline --no-merges next/master 
drivers/gpu/drm/drm_writeback.c
fb721b2c35b1 drm: writeback: Fix drm_writeback_connector_cleanup signature
09cba36cc840 drm: Include <linux/export.h>
ddd147d91d50 drm: writeback: Fix kernel doc name
ff3881cc6a58 drm: writeback: Fix use after free in 
drm_writeback_connector_cleanup()
1914ba2b91ea drm: writeback: Create drmm variants for 
drm_writeback_connector initialization
2f3f4a73631b drm: writeback: Add missing cleanup in case of 
initialization failure
135d8fc7af44 drm: writeback: Create an helper for 
drm_writeback_connector initialization
02c50fa60ca5 drm/writeback: remove pointless enable_signaling implementation
720cf96d8fec drm: Drop drm_framebuffer.h from drm_crtc.h
7933aecffa28 drm: introduce drm_writeback_connector_init_with_encoder() API
57b8280a0a41 drm: allow passing possible_crtcs to 
drm_writeback_connector_init()
38d6fd406aaa drm/writeback: don't set fence->ops to default
b1066a123538 drm: Clear the fence pointer when writeback job signaled
0500c04ea14a drm: drop use of drmP.h in drm/*
9d2230dc1351 drm: writeback: Add job prepare and cleanup operations
e482ae9b5fdc drm: writeback: Fix leak of writeback job
97eb9eaeb95b drm: writeback: Cleanup job ownership handling when queuing job
71a5cb3eb758 drm: writeback: Fix doc that says connector should be 
disconnected
cde4c44d8769 drm: drop _mode_ from drm_mode_connector_attach_encoder
73915b2b1f25 drm/writeback: Fix the "overview" section of the doc
b13cc8dd5884 drm: writeback: Add out-fences for writeback connectors
935774cd71fe drm: Add writeback connector type



-- 
With best wishes
Dmitry
