Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHv0Hyy7n2n5dQQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 04:17:00 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71C1A06AE
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 04:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962C910E85C;
	Thu, 26 Feb 2026 03:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icyp69qD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ey44SKbA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AE910E85C
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 03:16:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PH4g0F2561036
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 03:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=x4Oin2eFJWAEHjLuD9tLoYce
 wXRKKg+sy1mMDk6n0RA=; b=Icyp69qDaTGEUhbuhBW/swKuhVkCMrEGUdLgvjDr
 d3g41kocnw4YMsXB+IHsQEpJJnJX6R/zi912um7smpkQzs2y+DeSyCZTEcgis2GW
 P2Z0rrPBadlVFjd8HUV33l+pAK7IgQNrLnObLjFhOc/LTA8Z8VaBxMxVRq6XW1vn
 NG3E6IvVlTnVnXGwq36d3EMZFF7EY0305JL9lF3kXEXahbDCQ3sx7uE8mPHC0mmm
 t/PgLWOL0K8HyXqOhBWru6WSZMkpiZ64zr9xESyHFSbKZ77j13whcoPqDFwvYbrt
 uIXLDZaoQfyt+k/n329BZsVi8y9x+7Xhehp80WKtCG/K9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55sshkr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 03:16:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso425942685a.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 19:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772075816; x=1772680616;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x4Oin2eFJWAEHjLuD9tLoYcewXRKKg+sy1mMDk6n0RA=;
 b=ey44SKbAgtVf+XliEtB7cqMQ/yaSsZG+m9tqu7Q6nJswuS4lIbvVWaJorKN3+vJ2ZC
 NZR6/eYk5VnW14IjRW4IJaXlbuHwDSb7O5ucqwhN/dUnu/h7s8JmAsVKnVSDRLNQSqc1
 iggfjkvfamkK87o233hyIKUpnASrcR+6llyBarhhvO8mzi1exGZySiLiVrahsyF+Gt7T
 ZQfEfKVKfV5VkTx8Vym0SOMK3zQqtGXuQ+/wtn1CMNdQ8WfMZd+QTH0vP0zL7W25qGZs
 0SRzAvGxQG5QFpl+n0A3HmH8HIf0BzRjT5nF7FLbB1on61dLcGDZfL/3kufIlN/43UUL
 yeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772075816; x=1772680616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4Oin2eFJWAEHjLuD9tLoYcewXRKKg+sy1mMDk6n0RA=;
 b=v6XCguA6wNRsMsph4cbma678zXM+uRmD4aj0155odZRc3vg/8BuT0dDqOh1IoWwE3v
 i5eAl5hbANUOP/C0f0XfbMm0/cSX8eh2Sw2niGL9cOUUEbHxIejucieq0l9zi0HMND1l
 ybEbL0CLsenmWKVteQwCWKPa+9D5LyYvXuJ59gwythGzhF+Hx+AnpE2ThQj29Kq/aZSa
 0LxUl5UP/vWcSDzmEWFFK4eB6TQRcXmAuo0nhrOy0rl+KhDYHRgV9TyT98WC0/6rNNjD
 zN0XXh4Bnxpy1DlfmWxO7oFVuZKSyhOPmVHdZ0xeYo7bt4LYyOYvyNMmfpJrRung8cBP
 9aJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxgFXY05wFWCNIA6AykuvB3gEL0vz4AdV5ajT/bxUzSgtrhaAoqJuZzL4kCgxxlcr5Ax+xVCb9Wnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjLQGyuXEJ2yuKKKA2Yz9bHdlBU8zqNyMzOj7Oakf7JBsFuXl9
 ZYgOx6jyEEkgx8YIDFGvnQlner9Ml+GWqqXAJ+bcWVzMX8gGtyg9UgmsfAt0XRlfnsB/lRKb+tK
 yoe0LvTiIsrVMp2wy0UuMDUZ7JjyVirxHhZTLPuzdpnBXGskN/Zw2ctp0tVxBEbA7s2Nq64I=
X-Gm-Gg: ATEYQzwWvOl65adzdo4E3Mgck70Rke2AzcxHxneZkkBbbyJVSFxiJH7v0n43eBzcAuJ
 GqgaFJQCnAe6bqny8D6eutc34UYQI5o4H/xgErW93qnFejTD78lJP8i/2Zmn2MxOD2RmCFR10ds
 WOB0t3uSo6RvHTiGuN455BH5p/UZwRw1tCGIWdGtHxVrBQrzmTAynHa+PB8Kc+9bB3uOq/ec76Z
 7f4122xYx10K+8JEWHrNIUS63MnHzAKD8z7YtutjhAdqmeAV8DQOdEj5K5eHT+hCUvB6ni+Orbu
 q5PRDy1fZjQX/bX25yclnArwrlBhR0+//u4bhweKXA7lvvZo8/CrKn7klHMPdY3Qg9zhp2qCyRU
 zRfReXv/y2FrIwDfcpYKcEUrg/0t1+EKEA4I7Xudn4BcI0wFpe7YCsOdREEbcFycAqIEf9sC37C
 +gj2lAGM8ZaZ4m1Yb0NWD69opBvYczGtff96M=
X-Received: by 2002:a05:620a:29ce:b0:8c6:af59:5e28 with SMTP id
 af79cd13be357-8cbbcf5ff82mr384724785a.22.1772075816245; 
 Wed, 25 Feb 2026 19:16:56 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:8c6:af59:5e28 with SMTP id
 af79cd13be357-8cbbcf5ff82mr384722885a.22.1772075815795; 
 Wed, 25 Feb 2026 19:16:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10a05b2e6sm243072e87.22.2026.02.25.19.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 19:16:53 -0800 (PST)
Date: Thu, 26 Feb 2026 05:16:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dsi: Add DSI PHY configuration on SC8280XP
Message-ID: <zpilakwmv45vrfr2qvigelgsglgmhpiozw72nciqp6slyyhluu@ks2bys7r74ql>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-5-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-5-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNiBTYWx0ZWRfX9VTWQrZC4ENk
 1vuXChivZRG4xjQN+lC22lnXFwtXt+56P/klF7N8vFZosdPUkvrlFqkZG8uneLv57giP1fp3mmu
 7cyZ6zuaN9MWHaCQh7oVYhkEVwiQio5vA+nUUlsbLxWyUwbaW5vFkYIqJl6k1Ho2sQggH8aRIAl
 IBOCceXTb5WwKev2C/pCpFo3Z/uqV2eM8lcZRaxKa3xnsJPTdgIvBALRQGXg8+oudEsMGdUxPIn
 /60XGuJW5xP4f/uddqljzEu+PZw2JaUzqjMbTz/s+TuTpZzEYRhOMBooTfw0VowRVxwjMKSp4t7
 HrITgw2/cF1GPDPSFq2OHU/VFqfo+TDmcM3e1REKi9M9N4phqCYhQl0cs8gUQdXcQV7znh8kENg
 UlW6gVpCCua7hM2KXQFa18/m0b5J1oNytP1684pvTRyWvop7DvcSfN7mLwarYE2yhq+WLYkjDo0
 D9DXVgg8Q3VOVO238+A==
X-Proofpoint-GUID: TAcrPWYL3VdQNQ3z2Jqqa8YXkY0QS5ET
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fbb29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=t8rQu5QzYQlLpjgIwqIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TAcrPWYL3VdQNQ3z2Jqqa8YXkY0QS5ET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260026
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: DD71C1A06AE
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:24PM +0800, Pengyu Luo wrote:
> According to the REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL
> value(0x3c) on Windows OS, we can confirm that the SC8280XP uses the
> 5nm (v4.2) DSI PHY.
> 
> Since SC8280XP and SA8775P have the same DSI version (v2.5.1), using
> SA8775P configuration.

Then we should not need separate config here. Use sa8775p as a fallback
compatible.

> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7937266de..4a37c50d9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -565,6 +565,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_5nm_sar2130p_cfgs },
>  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_7280_cfgs },
> +	{ .compatible = "qcom,sc8280xp-dsi-phy-5nm",
> +	  .data = &dsi_phy_5nm_8775p_cfgs },
>  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_6375_cfgs },
>  	{ .compatible = "qcom,sm8350-dsi-phy-5nm",
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
