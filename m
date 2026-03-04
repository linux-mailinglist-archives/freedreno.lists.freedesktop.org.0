Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC3lGs/GqGlaxAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 00:57:03 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE672093FB
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 00:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA09F10EADC;
	Wed,  4 Mar 2026 23:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3gyhoDK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9waE4oU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E099B10E1A9
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 23:56:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624M6oh32275079
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
 jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
 3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
 Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
 dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
 o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
 DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4muqgv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 23:56:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4a241582so4036384685a.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
 b=K9waE4oUlkY1z+1nJ2ISOS07EUVvqtgVtFRyEEHZM6gQt+NjAeMmwoF5W+qhNVMCci
 J+BCFlHXInAdI6iwYTgI1R4CBPw+/OxRuZPQ59eIpeS9oswekvuvNQ3cAE1U5Ur/St17
 xLwJV1jsADxydTM83SyEzXJHA3rXFff5TQlOCmbjRzkNf0qbmzcttojZaEeptn4JFQ8d
 y8acgsqqi/P7hE0CpEr6RO2H9GlEsf3uJdwN9FJENB4HK2pCO2TTRsgZ0n7RLpSlIlzz
 tH+h3+NExBeyVyFiCqNxddUTgzwijueGUGGHL9YWUafCucwPZjNv2Izx27+K15UefRUj
 lRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772668618; x=1773273418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
 b=LRkI6e14aJPa3AzM/48A2OfEqnAUyk02ALreqthUhlNuCIBIzkQWwT5qb8waeiYnav
 bQ7av2dVT4crtaK0+Ot7ra/CaeLtgwuC8aE2B1u1UUzv7Z0tEFLC9oisJjpFGuo/9ZMc
 bOW8bLv7qBIW2SbmI73s325Z3OvGTVimLV1/0f2afidaVv95t2WOmpUBrHlm3XB5mlRD
 P+3urXPsvE6gX6bmrPIqs/wermGSa+8ZBRm3RKv98fUFAVWZKnVJXJKf/Dixd/UCJpGw
 w+PbnjR6+lR6fNmdEPhn3NrgVAOfPMIPkjeXPPZk7pf9izX6ymp+DDiNey6z8EAPGJEa
 aCVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQdfuZaya8tMe9L8x7AHtn+19JD4oxtU0irsTthKbf0foFnYK3PmQP7WAPEUhspmA+xWhpzM3/cbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyulqF/WGRbdt7u7cn8och8jlx+ZQRI38ORmHHfR2jOQwAVwRSL
 1dmg/LhgqDSPWm3SXYZ0OlmBAqdp404d7TFBfzOCvqUQN6zoVMOT46SgPwc/66NrhCxBowoKnvl
 sp9D/gKK4iGebebAaIKFWR0d8Z1JafB6AcWCEWsWdpoCEToLLxVQQzwcg1uxI7j79jabHRv0=
X-Gm-Gg: ATEYQzy+Lvmw+hagm0cih14kl4A+mLPvnFRBMOLJSFfjIQHcePrYC0FN3Ej/LhtN/Xi
 ewXmdncschylveS3Igt5rEGNj0myeix3FquSDiw5VzqHhVsTA5yEQuSXE32JfQzvUpq8v7X04ny
 +iD714HtS3zmz5KcRKbC9xefifOFxbbCPI39AbWWGL7vQ+Fmp31xyu2oMvMrAKqG3j6DDJjWST3
 GUsb5Q5eSe/dIsfsZRHXSCgrIo0+osoFma/ScqBOE4uyFLqOJgdP/brXIZYK6vkwg9t8cvR0O/J
 2YBBwvQREC+TXtm6pi3HYKkse5kWvmVViSLFLu3AARDHECFBkpS/prFmmEU/Y9Nxpv/CfDxHU5i
 BXeKifsHBNzOE/1oP5/ZDVtB8H3FAgoI1JPPpnD19i6yneUH1KGNM8l4j7rf9LonmSUfCXjIWWY
 93gPChJRrFjXMD425zVkmJVkgec5MTIJKJdkY=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id
 af79cd13be357-8cd5af775e5mr481318785a.40.1772668618474; 
 Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id
 af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932; 
 Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
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
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-ORIG-GUID: -wA3Wl2151MnxWM8LL4-Zx6qfgx1Vo97
X-Proofpoint-GUID: -wA3Wl2151MnxWM8LL4-Zx6qfgx1Vo97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX5LviE1KVOcpP
 VJQODdWPlEgGeLimrISNNR3nJRw6pXnWjyJ1f994QdjcVoKpiTkQgL0K+XJAnm05SEwxMn/0WkW
 ko7ZJLKn2X+PZVa0XkcNPE1VlInQMp5b1EKBqCQ1yt/2BlPLBjtmG6+88yw7oXzt8Uz7XNtc3M+
 pG4L+Q28YCHV4kOPsKtVIr+643526Y/W+DwE5pZxSMwvL30SHev7XvJXQWIO0UH9NSqqNOPbowQ
 jbPLGBJgO2Wa9jSXKynGX3B3s4BovaBnWr0e4FBw7ihNOTRhGhgGIJVC+2aZEqDz5XJnmmTKj2T
 XHQrQnZJgiGlA25D3vN5hqNZddCHrMwgrI631EZuVjIRyUmdsT3J+vKIOdI42S0PEe+jhqldrV7
 m6RvOvaelYDXX1wej9MCG4aN9YCzL0M9BlbzWqD1oNAP7vPvuWa0fKwvmqhPYrHf+h8/KNsFiRF
 HFDLtExue3oKkGJEm4g==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040198
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
X-Rspamd-Queue-Id: DAE672093FB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,nxp.com:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
