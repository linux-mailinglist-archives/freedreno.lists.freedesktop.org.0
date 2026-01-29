Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNauJACvemnv9AEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 29 Jan 2026 01:51:12 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F043DAA61D
	for <lists+freedreno@lfdr.de>; Thu, 29 Jan 2026 01:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183310E2F7;
	Thu, 29 Jan 2026 00:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhizYGFE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgDNRwfw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0292110E2F7
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jan 2026 00:51:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SH44GN1407437
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jan 2026 00:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=M+WZ5p12VkpfX832o5SO9e+P
 vKsqNe/lB/hAlOK3sLU=; b=nhizYGFEF52633CDuU4F8TIdryih2X4NqIejN8db
 TKdy7A8NYkqNhc+Xi5PQxc1HNdOln9lnwsCGcruzVQ0+aSBkhlp70Q5OFHICsuB4
 MTEcbA2Ra3cVw50EckPewbdt/0beA62X/XXBpPjoHYcBty5zEkOdMqgU2GCks9xi
 x3yi3EG0NG00xZwwV5KqabVpDNqT2c2ms6dpHPY6f4Fmfw03abvBoUOz4K3DefJJ
 6kerEiNnk1Uv53ysq09ZZa85w3UeD231qQbITqfeBLl5H3gzpsWzP+lS0DPizhVx
 31+suTnwCsbBugiFlLj9BWIFYdetlurQubsok5wkwseR0w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byphgh7um-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jan 2026 00:51:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-94839e09cddso402102241.2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 16:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769647866; x=1770252666;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
 b=MgDNRwfwonxqGZLXWTw534kzdbsfGy+fYib+QPdJunbWXk0XWAAxSeF1TA7M6yMsXt
 hKETBq9TeDGDHhPw16FTvdDybKlpPyNtGzvIpL4kpRQXdDXsN5f9Iu99XbaSsahxnON0
 ORcak1D/U8E7ubAdDAVbLBRmS+FYc2kKL2Ndsya4EBuMzV2l4EkQCWYiquHB9yLlipV9
 HletMPvBXBoErf+D7uzcTRbHvSthPGEYhm/OG6/ivU92BVp03tfeCejN096r3M2EOoU1
 AaQFHKEJa2rVDZ2SKQzdUXK26MV9324vW4Uzmc8ksstE7I/jxdBb49mdCpN55B9Fwxx6
 VINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769647866; x=1770252666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+WZ5p12VkpfX832o5SO9e+PvKsqNe/lB/hAlOK3sLU=;
 b=p1LdbewYn9E6KWJ9hZkTYskSB6GdYXh2wBZYn4HN73xb0RNN1sw4YMNYryM+Xi8B+8
 ICu47CaCAFOHORqyQh3KPQlJ4aRtFKVoK4BoNQ4M2WrMQbhOaeQAALZK1vp7WtAZ7dDE
 a6Vt7GpG11l7mHpLYdm52VARmy+nSYyZfZAi1BNhB8+xs2sZgj+vfsNNN9Fot67rpOlI
 lV6S6CcXlXOcoz9FqO4BXYDuHeCezvKYOOjnze+GJdombWpf0FPM6EdlEkuTM+FlnWKD
 CpFXzuGKWLvIwiKsdDWeRWgLnWdpM0jGpq4pmNV1tSMpx+LVFxVpmtGL8sKrWB8RsGZZ
 qOCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmWxHDFyXh2HEmnDVLyEWoG7xkbRUxno5bm4628hMzCNd+vmTVNqK+1y1te9SZIQ2o9Z/Fhwl6kzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsvmB/1HJDiznvPk7gGh8LCLCdwPTKgz/gT+YEZABjCUjTOIYp
 Oi6H6mqtAjkNIwLucYwDgallK3SMgRUpjQNbJfHsaXuGy7NxB23dNTK9G0eZHyLDWXt7/qRkSHw
 R9DXcjM2PCJAjJKi6v/12uWBmDCGJId9BCaS043IbVI54+teCXfY0Al8MqLcjnLQzYW3apmI=
X-Gm-Gg: AZuq6aJMZiWDW9+M2elBPpPJSKHc0bP2tRzUScvp8SpcOs7+vq6KzNYrNJL7TOpC909
 FKf3lo+yPF0iZJTnhRHYLyuNA3qDeJxaCabtI64jznVsN32Im6E/MbwZXFQycPK/iB0pmGPwy/t
 3NbbpIFsBvOPjYA/z78nykVN/M0s8zpRfKsWGHjEKao8XLjn/2ZyGbSlaNK8mgf9FdsNqgypbaG
 0Wwf6FFGKdv+BSadrGqFy2xUfw/+cbX3VUu3DWJ4yMwnGHbHT5n67T+Oaq04fPE4KOLzZiD2rLw
 EZhT7jOwGrJvNkT0wK5v7Hy68fZ7lQLZU0i5ZXArxfTY2E3NKiIB/+kuEhFjmD6hoA+9D0bQFCb
 J8stXOzsCpIDHz7XBZgcYMV2u/zdlUFRLl7ZvhmNY0mWcul8CJJw/4Z/y09tTTlSo6hlbbqtbAd
 F2hB8VmgIUBmxCvHI+0rgrp1Q=
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id
 ada2fe7eead31-5f723631147mr2251796137.17.1769647866486; 
 Wed, 28 Jan 2026 16:51:06 -0800 (PST)
X-Received: by 2002:a05:6102:32c3:b0:5db:cc69:739c with SMTP id
 ada2fe7eead31-5f723631147mr2251767137.17.1769647866075; 
 Wed, 28 Jan 2026 16:51:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074bbf55sm856387e87.90.2026.01.28.16.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 16:51:04 -0800 (PST)
Date: Thu, 29 Jan 2026 02:51:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix
 for DP
Message-ID: <77qi3wlmjzdios6a6kqifsbsyusohcddz737fmdgmrgxcqlpsb@f2wkl7sw7nci>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
X-Proofpoint-ORIG-GUID: TedcTvIiwA6jTKS3w4OMCO9bH82TekfB
X-Proofpoint-GUID: TedcTvIiwA6jTKS3w4OMCO9bH82TekfB
X-Authority-Analysis: v=2.4 cv=J/inLQnS c=1 sm=1 tr=0 ts=697aaefb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YAN0IDdG5KZRBbBB4vcA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwNCBTYWx0ZWRfXz5yNXaFcSXM+
 ow7rOZGIH9gKFGC+k4/6x6zGjPwgJuoIlJfTgtBb+YdmUNiigx+2ZXrFaU5V9vyJumIgskbFnD1
 Q6UIync4gu5T1m2E1JNOwBx0mionfPOgxQ4nY307OGn3PdnDqvaD6ABiOh8pP/QNjXWxyVnJTYG
 +KOe9dU3rvxoGY3j8OGNAAhBjYiq1BiG1JcQlcrjLHDW55UI/BgMWnYN37yg76FbDGCZp4I1A73
 CgalnqqbOVElXL1CL/rbuDu2Hs1+iNOETZWGgLqqB83/fNwYoUN4v9OUu4miIWUwPZXd/mkqG4e
 VWanfR+ER7tCRp1c31h/3E8GAAgAEmxkqWmspoIrxPl6Z2QPGPZ9CEQIWyFCqm8oLhj/dCpfVq0
 qu+CXk6m7lHGP2KIZl7uo5E+usbJq6OQ1r0Ab8hSjnWXGIcNLUSXWl8q+Oq6nHaWVmzL9Gjqgf9
 S1Ft+V0u0ERVmNXwHwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290004
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: F043DAA61D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:57:33AM +0100, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
