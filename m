Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNpMNUTGqGlaxAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 00:54:44 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB820932D
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 00:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D36410E1A9;
	Wed,  4 Mar 2026 23:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDzVpAV3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABVutegn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F1910E1A9
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 23:54:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624G2HAJ036001
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 23:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=D9sak1pWhxVBrwdJ2BGlDRM1
 u4FQCLLwnOBWXp3tU8M=; b=YDzVpAV36G9FJiGclgosp/BCt62vM9M9b056E3f0
 U+5xxlejiEUamIMH96BixcO5AaY77ZWBlSAKvu5XqmjeqoAku40urrsPuKmmnS9v
 3OkMLayFRlSKj3dBR7WZsu0j9iU2lRzpg2d7kLVS9w5ZRVAO2FJ6BsTzjCt69c98
 JFzB7UN71X/+3QF9qLWJGMzkqHwQXXEY1ttgq+wcei0KjxR3Fsb0D++XmNf1CbY5
 5aKHM5x6QqkmdYtjls//+oqXfFNFmC5IchUi4ZbV2wIf7afsnXeYSOnIz5G6c9dJ
 RXin04p5y380S3mSuZNgncUGt9sD1j/T6Lf+R7oqd/C+mg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwg99d8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 23:54:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-89a178d7270so70243506d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 15:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772668480; x=1773273280;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=;
 b=ABVutegnhE0WPKVpxRAW1LEkUUOLXwHRj8b80QrMLQsGRn0mryA9+2zh6wsQgQ8mNz
 FcP6mGtlv8fFYujOPHbYy2EzMxx20Ul0gnMqJkziENrxz3Tb+nekwrSdVVszjcOK17ti
 bjafDOLvHzL5g10zG+biGVhWQcIeLuJavrIThZGQ3RtS7JGfe8P0yw3APdwx3wKgQ3X8
 ycDUq2mGLecfG5pAvxBoy7SM/tnuxQ4G04MowuMYdmwGydmbUhsbhCot8COglMZxWyND
 WMleVNRSotTFNoGZNIeFvEqTrmKJqG5aynxS1KmC42NKbXqX3gkCZAGGQPVTG0V4X1kQ
 pxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772668480; x=1773273280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=;
 b=a1WisJkNbQmKsTT23ugY1nmhMMUJjgCIbHxA6SZ820bIQ2bmufkPvDP0AoPvs7Ax5c
 XfCLI4eGxN2EeRAK72MMIrAuHkjRfN8rgNcWLiym+eG+dnh2qjNUoFi4luDcxc/H9dPw
 pV/rt0leod5uTt4Lv3CGkoDkxsyCULb/whP3CmCiPI8sBPBhoeITykG2/Laz66rKGrEm
 9P8FHdG1Ht4q+w4NgoWxXQ9VOGp8hijN6ZNp0mpWPw3S/AeySVNNukQE3igzNuW6FSEC
 oMXchU0l5ziFFQjOwCoF9hsSlykgxgcVBHa6NR1ZoaPrg8m08h14SoeD/W99DapNe4Oj
 ntEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAze5DHl9mc9l5LHtdFbfqzswaAFTejN22IbEArzLGIm1EuIcJsqSDbfV8eYe0+b72HZdBMzl1rPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL3mui1yqcRpG0WCeos7CpqmYFMX2mPCgKlOrNm19g1bnh9ZG+
 kg47PbgUr692oR8hkq5lMtlwX5RnqUN0t4JopRNrNykFcH+K1s4Bwhtxx5tJE0Rqhi1wcvVUsFt
 B0x/9w73kwjc5brTNbcpnHu3jV8dU3Gh9jxkTUxHMVsduHKiQtebzzd2zcj0to7aOQu7vsPOQgd
 eDp4Q=
X-Gm-Gg: ATEYQzzE9LL+bNnymYjxZVX2fQXPwzirQzM3zLsYAqGRFcsztt29Jdi/fWNlYoc+aiT
 gl5EclCqYR8czo6fGzfXrqQllrJ7Y/byyYcOlV2+zGXm7f/8zPfZvuQx1GcbIoKlODV41Xl+ZWP
 Vj233k5FLI0tfxOBsJPpFqX7f2umfbmd+soZtEBOsE1/PggFJFw3IqOa7dmjTrXBFui2NoJoLo1
 Nf7EXAEX/ZoxdGQw3rUyV5SX4Aj0b44+VAGHtqz/bGMT2jGS44ByNcryq1A4EjboVCO4Vmwj479
 IIaQvucd9IvvE1/jNXBxlfoUuIJVMq8BJmckpT6re4/ISSR8meGmmbhQf3PSNcaC/8J1/s7zXDb
 SMk3mZFxWdjob/nWHS2A2KKOEOtEuh8TXUa2maZeQzuoccmR7MoZx70QDt564Cj1ZP4NVSA7dhq
 SpVYEiaxLtSo7UjFA6haaDQh6xGYBWnRDkaXo=
X-Received: by 2002:a05:620a:2986:b0:8cb:5442:d537 with SMTP id
 af79cd13be357-8cd5aed61e0mr519313885a.12.1772668480050; 
 Wed, 04 Mar 2026 15:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:8cb:5442:d537 with SMTP id
 af79cd13be357-8cd5aed61e0mr519310585a.12.1772668479418; 
 Wed, 04 Mar 2026 15:54:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123573c42sm1615588e87.72.2026.03.04.15.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 15:54:38 -0800 (PST)
Date: Thu, 5 Mar 2026 01:54:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public
 <linux/phy/phy.h>
Message-ID: <cleew6tvum3jnflztfcqfwtafu4hjizjvebzr7qrsbnnp7vvrx@fjqhyh57o5hw>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-13-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a8c640 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=lO4ColjPjyWKUZOT0LYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: Rt8Hqpoz5FaG_Ham0klqCcUze1wco5QZ
X-Proofpoint-ORIG-GUID: Rt8Hqpoz5FaG_Ham0klqCcUze1wco5QZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX37yUhhRebAI+
 zLM2tlXPcXTeP46LTw53/jNpMdr/9Di0fpkqZLgUL/MJAltOZE44hVfgM5TG5bFcU3BK7Z89uP8
 gP71Qb7pu+G/UWLXuHJ6sc0Fjz9PjlyeujYRqsHWQBjqC7RAQUsKhIZyM/MC85x3PHezegYx60y
 HjA/QApoXdD8bFaoipc7rGFTCYKw4V8NvYJF9ybZePbBHTnfS2NbZr3apzF9ENbGzotIIvgsMN3
 ZM8LR0c8rePi7b/dE8xlhLcwwjcghT+B8frJoxuR+1lwbrZXJnVXgg2LFD4Sd8eqSSrlDdsopKh
 GhgTB0OGu29wqIUQ/fdtQn5lriB90+3Fd2j9flqeV9cSax90i9+g2dohslKE13DgOkjBQalHBL8
 qiJZ6P4OU7WS5vrO9qH/Ny9r375QsXJZFJhIXTtlLuTla2+M7vd40L9D1zttulUMALNTTcC+R1x
 Vg1Nb/fP27sS/fgnn8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
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
X-Rspamd-Queue-Id: 46FB820932D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:25PM +0200, Vladimir Oltean wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
> 
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
> 
> Two slight points of contention.
> 
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
> 
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
> 
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
> 
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> 
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
> 
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/phy/phy-core.c        |  34 +++
>  drivers/phy/phy-provider.h    | 256 +++++++++++++++++
>  include/linux/phy/phy-props.h |  75 +++++
>  include/linux/phy/phy.h       | 499 +++++++---------------------------
>  4 files changed, 458 insertions(+), 406 deletions(-)
>  create mode 100644 drivers/phy/phy-provider.h
>  create mode 100644 include/linux/phy/phy-props.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
