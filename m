Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE45AEF612
	for <lists+freedreno@lfdr.de>; Tue,  1 Jul 2025 13:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10E410E595;
	Tue,  1 Jul 2025 11:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxGCbSNY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4310E594
 for <freedreno@lists.freedesktop.org>; Tue,  1 Jul 2025 11:05:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619q9xL002161
 for <freedreno@lists.freedesktop.org>; Tue, 1 Jul 2025 11:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=; b=HxGCbSNYdM9dEslB
 SjttVn99Amwenu1R7wnkDaKhJaGda/8kM8YFf53/KU128vsYXxNaf/6p19urg5Hm
 mYCDLIZ9YNp0bV30kTJ+Rt4Foy0l704s9vQWadf1pTdTdPoXhVRtrebwpprrgpCi
 UY3DodkPK3T9pc+OLDNmF4JSjRfRTeHRljUvYejXugYVPq2SzWPo2HounfW42x9K
 v188gBN9G0wwqxoqbexRfJGHSn+RRnABE9Pa5gYXip7lwwcUgs+8NTYf5SI0+Mbu
 YEfwZlOmCdqKzcOvF6RoyxB1GUM8rC9ES7eG3VmqFoaRNnK+/03UvbjwbEYabwFJ
 l02HNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcrfm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 11:05:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d44ff55c98so615729085a.0
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751367943; x=1751972743;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=;
 b=XFbGEY3lIQsrkblS00BDywOWh62DhqM7bu9C9M7J1qC94Mj+ve2+G2J593+w/m769L
 cYtYqAgfUBfzxB+SMmc1q0dE2aFNYQZHnQ4u73HuFNiCY/F2KygfyN2XvMtiBPNuIfrH
 DUB7ZFpYiWR4+xUlrI5L6hcSa27/+n4K3vcwcVTlgC3MnXoAv63V7EtkIEYlesXehB8o
 hrSVFisjjoQauOgkU6aItk9miyY37dNonbufPF0UpN3D+HIzWciH/PoTVZmHK9tfqZJw
 1SlQWLnizau32j1Px/nLSGzM5IUS3V4jdY363KdRetSFC3sI6xOZcYUDxTYHObfzptss
 aozw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8CxYTxV24o+i4aDdeWVad40ymyfgCi+NsCwaJjM+fu1Wy/CHzbBU+ReIZ8xaVEdxMATaKx2mXc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjJLKArhrOVUDbSrGuKjmPgUJRR75BwqI4hznBceVpdYLxED3l
 Enh+nzqeF9AveMY8IU0hKh7F0MPmIqZLhW9t8TXCGJxXO1PAvUNonSBeZ5TtRqdFVOC/5WdckqC
 xA3o0uorNtPLFQWJ2j/k/dVT1OIySkQBJCbDeoLBfo0IeZqBik+8fOWrVpDauz692pFUXPLg=
X-Gm-Gg: ASbGncuS1BwSx1tFfdK9eGzyC/l7aZdlzvR/082HFLnsIwovQpTUiIBKz0PkNLp+iKT
 cuFap7G0sksBGIGd4pD9ZfQEIAhBTIaT0gpLG7qOv6I9cp1kuET6trb5Ue+oguqvBvGUt9dV6Go
 qPzhcWI4yj8wVQesMuyUjf5V6hHZuNs3T05efEFVXbAumoTeJgbpjLnOb0zdFOfv3jNKDVFGktV
 JtPD3GeKP8GuBeqiFUkEO7Li3qngVYVwHhmHLVARG2y50Y0e4H2USXJItxWuBUTCeyKn3Q24I2o
 Dmm9m8LWxgJL+T7dv/wvnpA7lgGi2AH9NJxVkUEc92lAdv2DdUQ9oi+yVA+AiN0FfcrRPinNVHF
 lO2clCtmz9ZgoiiIMartQD7FH+60xfRz3Ewg=
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7d44398f399mr2458868185a.55.1751367943245; 
 Tue, 01 Jul 2025 04:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkaK5r4kmwq1bTXLA+Z1Z3MCVlUfECWUH1iOnueMEvJSOkDSVRInqR72D3IhCu8jIVuwHmSw==
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7d44398f399mr2458863485a.55.1751367942731; 
 Tue, 01 Jul 2025 04:05:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b24048dsm1783299e87.28.2025.07.01.04.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 04:05:41 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 05/19] drm: Allow the caller to pass in the format
 info to drm_helper_mode_fill_fb_struct()
Message-ID: <t6yywwa4z42d3knc3ihr4d4hzenhtzm5noln5y57uwzlotdkxq@6neoszj33sgx>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-6-ville.syrjala@linux.intel.com>
X-Proofpoint-GUID: aEQ-7ad0Q-uHaxmMVq7qhXCfArFxK8pU
X-Proofpoint-ORIG-GUID: aEQ-7ad0Q-uHaxmMVq7qhXCfArFxK8pU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfXzcPtJ9zIHjYy
 rX3s9B/tbio+8SVm11xyPl8URDG9y5SvdKbOYahs8zHX2Ere1nQXSoj08et8Pi4GvdWYHIB7wcd
 g2AEfGYWxCQvkubOcQTSSkDersTW3dUW482VcKdPxUADeZd8SoWSpW/4z7P9TD9Epvdp/sLnmKH
 Y7NfxhKcDwM3LjFKfiMgPkXWUgE6QhuYOZhfSilvc4tOAGiRcr6IRxR3EJoO3ndDG1p+WO/3Wpp
 3uewsy9fVSKrfNnsBZHREP7jbm6czOoC2WbikxxAke8H79wIwwA4L368XVK3xYQPhoxsWEDAsNK
 BBaxrkSEtPQaiay/huNYH4xxGDleq1Q6kDm9dbQ+sCwYek//aPMtpxknjvqDsJzpJoDfoTvFFhw
 qCVSV2cLu27wy+eLRls0YyefGuwAccjLUuOBL+aiQyuVb/fYj+4+J8Ct+Tz1bLP41uxtHhqk
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863c108 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p4Kof4svB8ImVrqtDUEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=609 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010068
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

On Tue, Jul 01, 2025 at 12:07:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Soon all drivers should have the format info already available in the
> places where they call drm_helper_mode_fill_fb_struct(). Allow it to
> be passed along into drm_helper_mode_fill_fb_struct() instead of doing
> yet another redundant lookup.
> 
> Start by always passing in NULL and still doing the extra lookup.
> The actual changes to avoid the lookup will follow.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
