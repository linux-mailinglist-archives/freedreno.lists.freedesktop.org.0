Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH/IHRVhcWkHGgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 00:28:21 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB15F7F7
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 00:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BBE10E8A5;
	Wed, 21 Jan 2026 23:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsYJEeYi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJ5OVOnb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D0310E8A5
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LE0G3O3464029
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=; b=LsYJEeYiZi+ir41k
 /M/p7bmy9BEKyhWDeC7X1Px29QRBF022A4oM9VxXfFdXLw6K+6YZf7QSM9jfN8wz
 yB8YPz1qsU6aJd588a6ip/C+gEAB/HvaW2y46b2BgwE0cwJyCqFisqoI8rlc1bRA
 NjHtqU9lPWMBrNUcljNhFJtHnTS0QlNfvA/ksPLUsxRpOTJhRjmzfNo1GfyC/Fny
 mnkJpBLhWWestCkx+Oe7CCz1IJFjHxPuP2e1nWfcrs3x9h9rJRYOe5Rse7WHJ8lU
 Xe2fBsXNXzxx4SOeOltJ7QPkmgoFbt/nzz3hq8C3N84SQFpuf7NhLaRoJxbumDAL
 c2rAYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0651qxt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c6d9111960so88092185a.3
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 15:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769038096; x=1769642896;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=;
 b=KJ5OVOnbiZ6fGRmzxPamF2Bn1DoFD4i9NpGhdRRD5KU4WC0bLSp8COr3y3wsIi3OAk
 0ganAw3/6IROuKPzrBfnlj+upKh4bk4rb30D9jgToyLDKf0YeMhkSHtn08p/0ol1abyi
 i7OMOMTdmC27jlS2P4PDdzEtKFeXEFyUfQky7+huU62K2B+0SI+/Ghnw8zobqYo6+JkB
 uGCfRY0puEszJlZtJ47U55s0fz0FkgMrJ3Mm3W42sdppu4aFeCP9xWTSyNxh3bbWjvCZ
 BBIvcrzCdxqua4GOBjOyTpk7z49sEjLsGb4/WB3ffURlZ5aheqVdYhPCbLHSreRO8/ty
 Clfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769038096; x=1769642896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CIkXGiXGM2ebkuHAMk/WlBNfG8pEKh2PCRvMi0qD2oE=;
 b=CzyqAgSkeVO1TaK4agwDVBMA7qm7qC2G3mVbmFAqEUFS4OyAOX6FvUuyA2SLXyJv8F
 qXymMFszr33cbNRA4oTtoXSQYffpL294QVozZkMr7NbgViHhu+r81JorVtsesq9cJ47q
 TBjyYtNt0fLx+wNdpwvXdy+uAyeV9E5DkuyW1D5EHQ2OsmI7FW+VEXD87h/6McC+DxcX
 NBVohCVex2zTYbToSJAHXs5zmtaNZG7hKZ+DCXZsl27MaBCPoJnIhkRyYyAd5quES3Df
 +H17GVhVpZbxyjl+A9RCaKTvTslKc3DvXuY7MIngi1yHQMO1gnSviF3O4a9RJgAehL6l
 IXsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfiA8DCf5wkzOxZM4ReFC3QYO6f2eeYwsqeJLwIPZEw0mHhsuKXMz/AC4eJwhwSLYEp+QaeTczkSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdoASuRZlaHIa3hWQcXc9wYTPGTe51Km4jJIB297qzW6cd8G/X
 ttI70YkoNbUDSX9mtvj50WgIBMTmBTCchfjucQsG6hXMMDWmle7T28QB72fYktvBr10gL1Czszu
 jk0BhF8/V+D+eFphp3r/4WGAK3j7C5lSFFUWPtccREg+O4zoxOgHIocQX10l49eu2V12b3+g=
X-Gm-Gg: AZuq6aINFxEgxYpGluu6TWSY97E3stO8o3OV6iVcTVYPy7u0+fvWcgfqoqhEYLbPPG0
 ip81i0+zUsDPGnl/WCQ/mBLSoyaKJ6be+1uNH40JjeHeLzYzyJbmgKtuoZ/5dl+u3RsW5RFoBk8
 gkc43d2eMDsUaeg+Zr2/acXyv1FR1EiZgPBXmq8pYw6lw32/MtjO+HJAATEogpXJq/FJKlgTaNN
 ojCykbBWU8KqsNlolxdcb5OWQCY+IrgU/VY0OzuVtP2G4ThSqcD0eXYA+3+6ovaFakyKyb1MbTV
 O1HFhCFtBp/ly7Bq7EKrU5MO/m93tPCR2YKZVOcfkkDo+xLhF8Zd6MYA8J25dFembtTZzTTq5jF
 T+CYAoJ+k5j1C6qQ7STHCin7rDz+37Gj1TkkfjPJRBLgkGm87SS5n1hTLJD0Rk2CmuuCy0rSQpM
 xvyH6RUe4DJ9X0OQIadbPPPLk=
X-Received: by 2002:a05:620a:4729:b0:8c6:3c47:74cb with SMTP id
 af79cd13be357-8c6a693b459mr2526855585a.49.1769038095916; 
 Wed, 21 Jan 2026 15:28:15 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8c6:3c47:74cb with SMTP id
 af79cd13be357-8c6a693b459mr2526852285a.49.1769038095495; 
 Wed, 21 Jan 2026 15:28:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 15:28:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Federico Amedeo Izzo <federico@izzo.pro>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 nicola@corna.info, David Heidelberg <david@ixit.cz>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Date: Thu, 22 Jan 2026 01:28:11 +0200
Message-ID: <176903808261.3665431.13908299143545119394.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=69716110 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=nOrPF5vehO7w3AbniEYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: rzwQeJ0r4A4tuz6c6oNc-bfMDQRErgCZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfXxjXV1tJepW5L
 lVL9C0llLjMgel8JJARTz2Ebn5KbUptL8Bv2wS6vvfBlqBIzz+LVkRlNFYvB+kx8WjRR543CkcY
 RkSaTD5XzYvISYP5Lkh/ISzErG3rSRintBcytUsYTDDppjK7z+7sKT+bXUd3Ax4lja2GHkk8jHc
 sBxICR/YWLSMZQuM5luHJPfezdsjDdIAQaUxwbLCunRqj23vuNdcPAdJS/dbZp4xIft+jOaZcEe
 gSBHnqjWxFR4SUEWBQfA1XBjuVq2g1wDLZJUMoWW62RKyeY6Atk9L3zWwFZmJeS4TREJqClwbyz
 zqIWUc4gmq4549Oa3YnhdhtijPzlgh9gH2X/jAk2lbHcM+LkjNzyClLkHzgxM/6bbGw5INaVRFy
 aTIblyEksAu8Q4dBuA//uL96YlJa7zrmg6gDh+8fZiPO5AeCU838AzKvT9m2QE4OwaPT1jlJFLQ
 lDJ9iTsfX+PyQiV8P7Q==
X-Proofpoint-GUID: rzwQeJ0r4A4tuz6c6oNc-bfMDQRErgCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210197
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:nicola@corna.info,m:david@ixit.cz,m:agx@sigxcpu.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,izzo.pro];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 21BB15F7F7
X-Rspamd-Action: no action

On Sun, 19 Oct 2025 12:06:32 +0200, Federico Amedeo Izzo wrote:
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/39a750ff5fc9

Best regards,
-- 
With best wishes
Dmitry


