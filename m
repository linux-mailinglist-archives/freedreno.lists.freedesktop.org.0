Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KegHVFBqWkZ3gAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 09:39:45 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC920D8EB
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 09:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE4C10EB93;
	Thu,  5 Mar 2026 08:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs1szgR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx+oMm/8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2B110EB90
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 08:39:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6254ta8t218476
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
 /K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
 JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
 tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
 +Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
 i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
 1lqwYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380rprr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 08:39:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb5a76f13eso420672485a.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
 b=Wx+oMm/8OK9Bx/a224B398MsUAK9IM+FA0wGTHGuMzm6XU7nYat28Vi+bHqMgYMOvM
 TC0YRiu7ti3GnRmdNzItNRXK49aj4dcbZWCylpk19Rm6s9cohuhnlVlMN6oP8Ovf8ANq
 LYVY4qXazU/pBiNbp+EhhtZNUUvgVgPicGB/4MaPTnwFO8Y2+ejPBU+yW/KId/oaA5Ia
 3XuJb7GaSkDcq6uWjIOC82QIgc5twl0eUYAx+q2+oSay9ti9pvRqzAQdHjYr1niTvR40
 Kb8mnlSyUBRAn0ZR74aR+Sy86bzPWzcai2ISG6Br80pjRFMdrQZCL74hdxLVu75sBytK
 0KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772699980; x=1773304780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
 b=dM5mXtV7eIeKrSgsSXeMTn0j/GpTYKkY8LMcJzMnvIXYhCq64hkwFY/DGEvbvq9kAL
 tYEKKL7ruyFrnjRJdZvLzCIOTz2vSpThLbQBwIenMfDg/vHt/1Kxd1MxbapaiuohyQzq
 rhuGayxCyf4yPlqUhchHoeNGzXN5NPVFCJsVgDZe8gIJz3sZFuPIcnhbt17mvCrtFmJL
 /f/dmAEMePLrRjSTktsX+rEjDnhSv7nLgfvRgubpDFDV74OXxHCF1ipHlpWrRWgvoiLt
 NyIK7DNfpBPBxl0vqhyxV0R/o4yY9ErKXbo72X+ngSFRfr5cqO1lyrPYdbGS4PH72tao
 NgMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSeC/tU4Km7JQjhU7usKSIDFLllr5E7T1qTPEzE1Re8nQLM4HrRPkTrt1CBW4yINOUIZx31yytK98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRSeRnoeVOXAqFLgoF472pLF9A6pIqCCKbVobUUTqutssKQYvo
 hL5ScSXa7eFPZJ1fsGxJ3odRWDRR1lTd1T1QDN4gl3VDrkTh4rPw459pPJmjbj12fLfxnirBotR
 9w+yANDw34/mYp2J/N+w7tbdZcSW0L56znlMdcdRWsEOt8xO7AS7uESaXPHCnAz/SnA3mvQ8=
X-Gm-Gg: ATEYQzyYO7IvJetgo/BZRzG5Hi0TrQMSKGJmnrEp6p6rFQY/EezYbvNjlywhFfwYuVN
 5htMDbJlDCKXaYp/MAcuCPvhBgH3S0A39d7UVfr96Vl4FH/RJDohArjvuYQy03FWZ5DJdicy3iL
 dAA0DreQzavKyZEJiAoIh66/5UWrZTKr1d4idEGcNseWLgG+DxfL7xIlqOlySNDCdR8rDKqvZ6H
 oRUEyq3qQEubpPd/QRlcrmTSCmg8NYnYp5/pktmj0GTzWjDKogYVbI7wkSlHNzLer7DXcNQeOTf
 eRiGE1Vo3kGBt4lkOTelV/HVBwqSzB89eqqoQ5RJGCJv9oGdRac3qNJIUjY1P+47/FGEBcI0XZL
 I9bexZtm8FjHeEWTJOF4dZxEBCZmpopYnuBsO5TGARlcUHu5bEKo9S8JmrjH8bY4ORH1V3GVQXR
 ufHKM=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr452358285a.9.1772699980140; 
 Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710; 
 Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
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
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a9414c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: PvrQaAKkhIH_7KZRClgO06FrQTTgrFyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX7jX2yBmjNjHq
 voptit1WloLR9nxAq2DM9OtIa0TQmmoWLm3pwdipj1SNk+3WU95/FChTp+1Aqx+79U3CDWzmtiA
 gaL4w4cPvJ0JaENnhCHAMKrmPtLXr9i8bQQril1ga7KpDExDMP2j2NJ1NdGou7kp/nN0icZicq2
 8g+zt4X1EOE5fVbCJnF1g+c2SaICHStR9NV+AYnA2uJVSEll1ByF2abynRzwWqaYTAlayAuFNBi
 cdptv1grDWNTn0PNElAjADJFDa0ukMbv1YxrZuFG0sPpWOPIstwm+VFJepdmyzLND5lMX6Im7w3
 bHIQCArvE3Zq0HZH4fpp6zfahRguqYydFhpxT32E3wGdRqrpWwHOSAJBH07dSERSSP2TatiuvLH
 IjxhfZUciJdGGgk7JqqeFzOTeCt+cE1/CyB5K0YBrUoRYOkS8712a+orWIlzvuGY66C+S/cBKa2
 YDqbxZhDLjAiRQAwvYQ==
X-Proofpoint-GUID: PvrQaAKkhIH_7KZRClgO06FrQTTgrFyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
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
X-Rspamd-Queue-Id: 26EC920D8EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad
