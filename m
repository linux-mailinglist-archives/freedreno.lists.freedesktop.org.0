Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10189B1AD53
	for <lists+freedreno@lfdr.de>; Tue,  5 Aug 2025 06:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3D10E468;
	Tue,  5 Aug 2025 04:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kzt5V+6x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09E710E468
 for <freedreno@lists.freedesktop.org>; Tue,  5 Aug 2025 04:58:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574IMJCE010359
 for <freedreno@lists.freedesktop.org>; Tue, 5 Aug 2025 04:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZJk8ZPcKnOpx2SNNbdPGbHCx
 Lccj6TZBqXskHVjiVyc=; b=Kzt5V+6xQ4sPGQZHZZzOITFZ/wk0ZUSxsrZL0Vnp
 Xx1l01K2Gu43cr0/LJFnlvqqBsMZVzzkKApUXwa+gkvaZyfRb+LckZUXlnS2xeaa
 gc/UB7HiQAMs0jcn35W7ZNKSvcBqC5D8Zp+uQY50gOwxMCyxWylqdHi/tw3PlD0/
 6nm/gR0Az9SnA620lLuc3hPNoySvKw54dIVv9M2lSBDJYEK/qwWd+ngG4jL75hL+
 u0qjloA8qwCPjIkElxnwGXW4gnzohY/0A2PdtmqjoE/Aii48Ik0TGNxr1tonRnNB
 pLAkMIuntt06gt4WqMEXjC7JW5w3W8VkvRnUnkVbU+OinQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek76p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 04:58:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e7807af588so571888785a.1
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 21:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754369889; x=1754974689;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZJk8ZPcKnOpx2SNNbdPGbHCxLccj6TZBqXskHVjiVyc=;
 b=fbiRud5EHQtaLgNNhOF8Wa42VOYnn3a4xZXxKSwxyUDxYqh2RnafvnsZtVp8oSJikI
 odlOZ4uWDQlTocdvp+Tia8CkDbXD8ENLLzEP2PgZc5295AWycYiAu5ITFo26EYljTMDp
 46dBXKt9M4eMGbAsVU9l390VKdkRCPjH4RYpaGLzXn7GhVuUVk1kOJkk2HAgKznFkV/t
 r5mULjCkjJt7wQZGvAp+RwSJlF8bOWfpiahyhCzaVhC4SDmUm/NBaLG4FnQHkQfi0NqW
 gUVTRDYPDgzWQgD/LbB21ICVxNusqZ+BahH0YD8c7VSuBRUD3iC+mlRu2kmgVrVE96xV
 aomw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMN8K3v6cf87bXiMKs26y8aA1VPOPrQJaFcXw0ursk3sT8EgevaN0BhrB/6AF57vMWTUzIz48UVdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/tLqh/iI1JJ+Jj7J+I9LkVAUgVBYW/o7ZIMR2G79hxLcLMRFF
 aTGvxCaQU+DxKMDdf1BpbFlTaWKMHpXdUMjhYFNFiWSFsrpaBF7iWqWlCik4SR9RD4sjrcS15dF
 HkDHGJnIjeg5D22bsAtO62bJTPxHHUH+bySbVFsAegUfionyZ1mZAk0IpSQqk66b2Yt0klw0=
X-Gm-Gg: ASbGncuWL265kX8w4CejeiE5z8dhHkejPC40gPs9heyB66Z80dipQEoXL1XWP+o9VVm
 R4xaV+rU//0FMSJVkU5p3A5HH1eV4Usun0BlA6uw44tWSTykSDPlppOX3GVpoRVylW2fGiYo3ww
 Vzsaur825iheJxXSB1Ykjjscdr/DhdLnXE4YNRz8ZrJAoKvDXVaIR5Y5Sb2Tk63YJ8UHG1bPccV
 egoTkKTaXB4IcsMWvsA/aEMux3FmyRacUgCnwYzCuH7vagF0ShRZrIKCZ0jzHzVtNTqU3p8w9oq
 fPTRza4KAbgYOFkPAXsM/83stgbA7XNgg6ISxkNyuX8guIR+Sw1yAIFemBUA4cSvG6IZP+RRUOc
 2dkkMFeqSzagoP0bHWV6jrEMD12Tl5qMq+fM3lz+NEs0OW08uHviA
X-Received: by 2002:a05:620a:a512:b0:7e6:5ef5:846b with SMTP id
 af79cd13be357-7e6963b8367mr1194539885a.65.1754369888905; 
 Mon, 04 Aug 2025 21:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsXtKxDheFJG11QuYaCVPiIu+728m5NKJMdNbg0+TAMsOq+9gDo86NZhO5c8LUFYsWbjmH9Q==
X-Received: by 2002:a05:620a:a512:b0:7e6:5ef5:846b with SMTP id
 af79cd13be357-7e6963b8367mr1194538285a.65.1754369888391; 
 Mon, 04 Aug 2025 21:58:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ac54fsm1866911e87.62.2025.08.04.21.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 21:58:06 -0700 (PDT)
Date: Tue, 5 Aug 2025 07:58:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Message-ID: <pwnrvebmf77p77z3pn53kzivy5t5qglh3ngdmj33f7i7v5r4jg@sseokeuqindn>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <aJDHAF69VOEHwcKO@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJDHAF69VOEHwcKO@e110455-lin.cambridge.arm.com>
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68918f62 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=DSBK3S_xfJQIu1nZ6GAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfX3LFk3nAfLlDL
 J8I/ZrOzPgxBhHxb0MlvQbj0KXACk3HVH3EEVR3Vo2AclxKxDM2TkaqiZZ0mrYBJ7eNGhoAOSFS
 vDFG1CN5JVmcDH4q7sZD5eXKlT+VnlxNZJM1nBflFa5OYuRuWv9MxvOEoDWvKpY2ldv8fgNaYnV
 pLH95YZcd8ZR2whAIW0LR7YwkzTYFLCvqqWcT0g8dVckVDA+DRy5m4bJSnOTYxBT+5n22lUlwYq
 1R6+SCKsfWJZDqUSK9Nvxk2r3LhnMAlFvRgtT0E+5apw/Lxb/Y2zTsy1gizZA4U+8eTpMI3VaYh
 Gf6oWQt3r2WU3KkXuypR2zpkfjVPqcmEP2loWnlRv7qq6wgkNDOwSbLqTRMRdnTRD4UJj0pwmx/
 7/HiVQfSww26oHqM1JW66eoCP34V2ltPtI/oVz/cbcYE8x1u0RcemloNoFQaGsTOb5QphwAR
X-Proofpoint-ORIG-GUID: zGiiPL4tVzK-LQPa8SY_xeKuUV3GRRAQ
X-Proofpoint-GUID: zGiiPL4tVzK-LQPa8SY_xeKuUV3GRRAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050034
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

On Mon, Aug 04, 2025 at 03:43:12PM +0100, Liviu Dudau wrote:
> Hi,
> 
> On Fri, Aug 01, 2025 at 04:51:08PM +0300, Dmitry Baryshkov wrote:
> > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> > to use drmm_writeback_connector_init(), drop
> > drm_writeback_connector_init() and drm_writeback_connector::encoder
> > (it's unused afterwards).
> > 
> > This series leaves former drm_writeback_connector_init_with_encoder()
> > (renamed to drm_writeback_connector_init as a non-managed counterpart
> > for drmm_writeback_connector_init()). It is supposed to be used by
> > drivers which can not use drmm functions (like Intel). However I think
> > it would be better to drop it completely.
> 
> The intent of _init_with_encoder() was to be a special case for drivers
> that use their own specific encoder and the rest use the generic function
> that creates the virtual encoder inside the call. The API for
> _init_with_encoder() was actually introduced 4 years after the original
> patch, so that should give a hint.
> 
> drmm_writeback_connector_init() is more like _init_with_encoder() and
> I don't remember reviewing it, so I'm not sure why that was considered
> to be the better behaviour for the managed version. Now you're moving
> all the drivers to the managed version and you have to duplicate code
> in each driver to create the ENCODER_VIRTUAL encoder.

This follows e.g. the process of deprecating drm_simple_* /
drm_simple_encoder. The drivers are expected to open code empty encoder
handling on their own.

> I'm not against the changes being made in the series, I just want to
> see a better justification on why _init_with_encoder() behaviour is
> better than the previous default that you're removing.

This was triggered by the discussion of Intel writeback patchset, see
the threads for first three patches of [1]. We have an optional
non-pointer field inside drm_writeback_connector, which can be left
uninitialized (or zero-filled). I have checked and the drivers are not
actually using the embedded connector for anything after linking it to
the drm_connector. So, by removing the encoder from the
drm_writeback_connector structure we are tying a loose end.

[1] https://lore.kernel.org/dri-devel/20250725050409.2687242-1-suraj.kandpal@intel.com/

-- 
With best wishes
Dmitry
