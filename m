Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJvTCgSqrWmE5gEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 17:55:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC49231426
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 17:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183410E083;
	Sun,  8 Mar 2026 16:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbasPdSL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxt5ei7F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB7310E0A0
 for <freedreno@lists.freedesktop.org>; Sun,  8 Mar 2026 16:55:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6284t5q1932717
 for <freedreno@lists.freedesktop.org>; Sun, 8 Mar 2026 16:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zR+AF/0MXFFus+Zm+XvGXicb
 OlDeqrhcCp/osYW0yXA=; b=GbasPdSLyOmfFetceiARVv2UIm0uQ9FY+GDyfQzk
 +X1CwpX27oBVWMw2/0yJbGm2EI1Su8w9I1XzAnmCAaTS5U+uGcI5KEQrTPN68vb6
 qpMnTFZISBVr5RF3yQ0SACknmdXq/gdKQW4zLsp4LurHjmb7HdeJCYUNdjT1ikk0
 dIefBcyw+SYCsq7Wh0mleJtxqgfIPh+BreZScBOWh6RWhGMohtoA6b9DgDJVtaWN
 tN1K3/OOZo25VK63nXr0VtiYZ6bX9FM6QMkcnRGWeatnQNh2dGPspPM4vlCRVILt
 6TR6DYNGyybNq7MdEhbGn7inKEMfjVOOkQf37QoImRDkcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83atwx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 08 Mar 2026 16:55:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cd7fc27cf7so434611785a.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Mar 2026 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772988927; x=1773593727;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zR+AF/0MXFFus+Zm+XvGXicbOlDeqrhcCp/osYW0yXA=;
 b=cxt5ei7FKR4Tu1yjh2k+6mpbQAJlsHbOG7O8+tzMoXayCXWshrzOOVYxzre4a/muGG
 Z/A7s0XvO+DHBpQu9fJWUSukIIWbALvcKTjavYifSLF80tS6RKUidvwWIknpCNhJoAQF
 qgM66v1fdJ71A1uNhP8kwCBVUUTMndNfUpr7Ywb9dl0RPogIuSzN0PATkdujYMWh2URp
 WRDHu0LYoasGH5DOTdFOLGl6F/Ud4NsFwmC9npR+67gqUYd238iEWZPu2U3yr6Dy4QNB
 cSVQEgoROwM0H8W8iZL8vhpYkG77jrkeV3YNhs9iXAHMexDPgnPzcpcDD7vmUoE6FuWV
 ZSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772988927; x=1773593727;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zR+AF/0MXFFus+Zm+XvGXicbOlDeqrhcCp/osYW0yXA=;
 b=JHD+2SB21XcmrXUD5q/GqqX67vkYOFYfMlTokvOcgHYyKHwzDAapCLmdDRqkTqWA0y
 VxlHePdLEaQwVuhH6oOQ9uyzZ5Ge0z8JJzLWXGZN2mY7fk75uudvqzToJgm/OULkWQs0
 kzd+S/NpxyiSzlAfPLSBtMsa8O5NZCq35ttmu2PCh71zgqDFARCefxJwyaCQ0JuIeCdS
 74wBOl/seXnqrlBSv1u+rLkv6gccYPoORjf1rT2QWdzjqXFUnCPCj6VfzgJuU5r7kDS3
 bHHONRmHnYmWxWd3PpGC3TQmkbtM3tYLeYiCetpjHhOEfqFELWx2nA5kMjziIW27qub9
 IqAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1k40L1WCTI8KGcv6KBzoPvlvpuiB3MzwO7ZkX3scjFoCmMbIdkqz5eKmh3hcnKeYoKrJIOOePWNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvLcSEvHbdSRofjTDYct5f310rTv/DEJKsnbayBx5oUnJUA8jP
 E4doi4/+neP29+6x5FJGZJad2Ke74KTPHKGnMhgoH5yOrGBbEx8U9TqpCbbH5ORfnqr08j+DJiv
 pc1S6lsNgRXGNwgVl+gxqjSMOCJ5Dp73pVIvaKcv1gJeCgmwqC7pJRfxXhsV3+hLz1a+dVms=
X-Gm-Gg: ATEYQzwwlr61LGFX8F4rTpT+NlFhayCPuYRj2+gzdYIR34BJB4J2Ke7NNElDLNu24Xd
 4f1g7aBD06SjLAzV4kA4ud0y3/oRaaWKuGmFAQQUPNIIblTDG3rBAFvVz3Stpa8OD4XgD4oYWs2
 lwKJP/BnT0nN1jljsiwVz7A/7tARNxGxYOTZp1T3LhycTTzyEFznJlEkkeC2gIqIw8F4e4Z/H5U
 vF5ULz1Sh0GdYS2FZ3zhsi8SBhWVV2b+ZcggaUcp4DK3AyVFge7djtw2tkSDEe2aWMCT4XmMuYU
 CwMP/l8KT6SXiDqptQAjI/BIOroP/jRz7Mh3MlvY+m9fPn/dC8dUSNIXFI01lDfuSPb6ZHlbBQN
 Rt2yAZsn0GKOy7h2JI7cxLDi8uaSywQC//Z9nPGM+i6ClON+6xD3QbRe0Tb+mK+COmmG6JmVwJo
 5h+sbqxRCLmZnQRfeWTM071y0gFHwqH5pTFa4=
X-Received: by 2002:a05:620a:46a6:b0:8b0:f2bd:4762 with SMTP id
 af79cd13be357-8cd6d4aa038mr1050257785a.75.1772988927081; 
 Sun, 08 Mar 2026 09:55:27 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8b0:f2bd:4762 with SMTP id
 af79cd13be357-8cd6d4aa038mr1050255985a.75.1772988926629; 
 Sun, 08 Mar 2026 09:55:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13f598ff8sm1219628e87.16.2026.03.08.09.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 09:55:24 -0700 (PDT)
Date: Sun, 8 Mar 2026 18:55:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: fix pclk calculation for bonded dsi
Message-ID: <jcrcq23c4e47dcvrrucj4jqwtjcuaa5qxkbckwp73fqakpvdxh@r44ykjcl3u3h>
References: <20260308070628.482527-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308070628.482527-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69adaa00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Fte5J7dvKBLabNbbCpwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NSBTYWx0ZWRfX6Z3l9Yzzjt+j
 j/fjrvhusssGsDz8TKozLns8BawSzxwRH1nGVY0fFSAFPJUJzTvKgMlgMcyjOfF20IEJ4BQ0YRF
 U2hWSVaUGK0nk+uPAwkVQnYNVXHlzSeFn8HPWE4cX6lH8dcS3Fa6L+DJzjt2rHhafT7kxURkwLk
 Sw+KJDiPLpZAz1Uth419gcOSuHqtGuysZdU5YZdE5AdlsnQiKffDqlYHd1WrmyqkNTb/835HUSn
 9oD3haUaZMOPiQFZ8V+AEjIvqia8k28CQszzKV/rR0dm4U8pSQh5xUHtgCV/ifSwk4z9Mi5q6TB
 Yl5+5RzqSn2pHInWTkLObDC+9KVb5tYAfGfCTt3TTkPPB6MBjMXVQArwZjJ5eOhUZkrQPw+7pyZ
 twdlRcMLMfqwMzIUrXNuyZmsrb19N9GvFSsX27JCCHBuRF7qyvZ2ZuGlKfjsQ1c8njWDWF2E7gL
 RBdkd3fhwCqeGaRcM1Q==
X-Proofpoint-ORIG-GUID: dNWaFBoOtPd1uKwOHOe8lF8SXiRRYka0
X-Proofpoint-GUID: dNWaFBoOtPd1uKwOHOe8lF8SXiRRYka0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080155
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
X-Rspamd-Queue-Id: 6DC49231426
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 03:06:27PM +0800, Pengyu Luo wrote:
> Recently, we round up new_hdisplay once at most, for bonded dsi, we
> may need twice, since they are independent links, we should round up
> each half separately. This also aligns with the hdisplay we program
> later in dsi_timing_setup()
> 
> Example:
> 	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
> 	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635
> 
> if we use half display
> 	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
> 	new_full_display = 636
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> v2: add a parameter desciption to the function doc (kernel test robot)
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 32 +++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)

The previous version has been picked up alrady (before the report came).
Would you mind sending a fix for it, describing the parameter?


-- 
With best wishes
Dmitry
