Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FXVKWPmpmnjZAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:47:15 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87A11F0A38
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292F610E81A;
	Tue,  3 Mar 2026 13:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtoxKDAP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBjL+uFz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2B210E819
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:47:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mm5S2732260
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oKgmqL1YCMPv2o6NC8rarGbo
 mPdgxNVvsx/kVplRDBk=; b=ZtoxKDAPjQYaJkMtZodUOrx4EtRFn1y9eFTgplZp
 fcV2xPKmJzWL5QPt4VxvtzIHdIEd65EzM7q4Siv7m5vAfzV82qEpPJq9epyF17ms
 5e8oz2M7sXzpN17CU+bd88Y+4te/SQMRNXZc9+aXAWWAcfa0vwF34IAtJTcsHgzU
 AZBshHqu3MkMneDgKiTCNC1fWkjXYXDWylb1smKU4TtchvrFhBRxCW8f7D19nM3y
 l1dVGeer32Ggkx1fQxTzIOHhMqCDxBsXVRoZ4kZoNieUpi5S9jAdiIExPtEYQ0yf
 b1n01/Xob1cuNL9bfgjZX//cSv7eT8vA603/XH260AyYcg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe1fh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:47:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-899bef1ea49so87516976d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545629; x=1773150429;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oKgmqL1YCMPv2o6NC8rarGbomPdgxNVvsx/kVplRDBk=;
 b=dBjL+uFzfyO+WaOxJ2FX9htDKZ9XUpvDqF3yqSEqUJRVMl1IT9SIXHkEK3Jc3BTPaw
 zZG5eVzRzkcKd+9iXQh/XlsBNAskSDrnaWXAg+NnY/uPrvofO/NmUhzUqaruUtkYnn+w
 +08glI8g77nK9+Wtkqd7uX8NF7o5c2G6wY/LWk3uv+XGJ/bz0SNlanPywOTp60RM55f0
 f/rgSH9kOP+1SYhzxRebeAHv7t7k5ncetZFksU/MBgkssRSecSE9XFmU+b/ZujF5+bmR
 v21UXkJzK52AxIcQowCl+V8QjTFg8jjGAuReFOvmxUVPkMFY91ytfuQGaWmfKnICyl5q
 kFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545629; x=1773150429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKgmqL1YCMPv2o6NC8rarGbomPdgxNVvsx/kVplRDBk=;
 b=Th2puVpQnq384i4tiqA0dv2vDtM1ns/HkpA+oVkQ52NooeklJDR86frOrQcoT6wcYx
 JxatkNnLUoZlUJQn8bHDOhZmOTuXJtkkdGrdH2tryw3JRMXqjON1CgFZ+Y566PUbwb3O
 fcgt3l4o0LQ4UKw63PLBYgmZmURsoTVFUhxuWLVnzDf6T3Dcc9RB4QjYBzNpPsqpbazB
 18bPFjKmzeSSz0vy0w4pZOi5KfPYq8b4/yu8ERIyis9jS6lz9RhCRCweAj3i800OdOI+
 S7FnIJj7VYNfn+p11ikDwuxAzIJIWgERWx9EbgUhQ+ZDcHgUNYCSC7fZ4LtzWITPX16p
 jx4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2uKPNy/5Nw5RTIMz9corSH0v7tJdr7XpG7vbRiGofzgvNZRwMaecWoUH+Do403YMokL5P8NFxxNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4HAnGxex8PcY7OhVHtnMwhbzXLRNSAxGzVOOxcOXacXz480LZ
 4am3QgRK8sqj8zdS6dQu33ib4SxB8mIuNyKzT5y7HzYz4aDMy5B2CxDhRq3ecXKJlnDIuFI1R3V
 t6rB8xA2X5uX9r+YXqrmeOODLZ3coe4uL7IvrJZYhaaoBvYCtPX5D05/sYpvMx8OmKpgX4bE=
X-Gm-Gg: ATEYQzxWQlabmpDsKSzB6FgV/3NYpoyC6uGU0DERo7R1cia5AURG0KNo/kQgZeRtEgv
 KxwX3GtMSUCAaoWO6Em+MblrTFWV7NBI4SN2kACGE15y7+flWKHNk76VqhqGOUBpySHGdNh/ld1
 gv/ueNGxPpfOyC4mmHBppaXCOf6NSoarrvpARGQGjud69NQHosKLOMR6dHVx0MpZId/HmvUR+rq
 eU99in8oWdLVxeMjytHDQifmG3YLicaigpn3NUhsQrWwfgcvEcC1oMTh/UZcKA+KAOUieGNFFbD
 1ivNzJIerpiDobrTQncQ3FRzYIdEyL8fQcoVC2tQNvFN/hCIP++MjkURNd/yjOfi1c3QEqyFfCz
 195NkM6V2VLzRvtPQKuElRAG+smm+UXtIUbcF3eNNU8mthLmsJeyfLlzMaLmvb+WErnfbKpntci
 rKgP4XSSN8TjiFM17qeKu2DI6try8xtAHgxjw=
X-Received: by 2002:a05:620a:28c6:b0:8c6:afa6:2700 with SMTP id
 af79cd13be357-8cbc8df09d0mr1830333585a.47.1772545629070; 
 Tue, 03 Mar 2026 05:47:09 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8c6:afa6:2700 with SMTP id
 af79cd13be357-8cbc8df09d0mr1830329385a.47.1772545628539; 
 Tue, 03 Mar 2026 05:47:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123578897sm597948e87.63.2026.03.03.05.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:47:07 -0800 (PST)
Date: Tue, 3 Mar 2026 15:47:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
Message-ID: <s27pxj2gcjqbw27xslxzrhwl5nx4vez3z2bw423b63ddks6bag@hy55hk3hvefy>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jopiSVet-cBgv6_iiPQKosofDeUOwJPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX+5fWgGMuFEYn
 c7EUqWNJseo5yGj7Irr+f+ufR0SLILuqUpoRXgpsE9DMqm1EQB28HT/8jnBKwXHmvYr6IBo9dme
 doygeXqUPSwBH9xj/FYkQcdwdBvo6+2T4HJDPVRdJUuvO8wiYTzwkzgk4lPyRxXsV+JHuB4lClK
 C2nTD5qAC8CbSYnaXAUcPCt/vori3baArXtXKEP8JD2Rauz5/Y9LiuyTFcCZytuUDjvo/+OS3iU
 mxBJHFEHB9tUJODmjdcMheiXVHGREoDc0s7mzsoQHxf/vSRi9XO6gthDX6tpRU/H6ovl134oDqh
 DDtgZzMBeXAN2d+qoHqeJDmJwxWD2zSrV7wnXsR9u2LYXFdFRIZRh0d/2FstHhuKPbHhQfb1vkO
 d/uGcjW6P1SDW1Mg9q8t8hVuoMrHd7d1k59opFelcZh8dAAITMWzNQ6C4uhRKM6D8H79FKSHxAJ
 N7fDN8SQXuACYoZHsjg==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6e65e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=28-unnAo_Gxf_zrB-rwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: jopiSVet-cBgv6_iiPQKosofDeUOwJPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030109
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
X-Rspamd-Queue-Id: C87A11F0A38
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
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:51PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with few differences:
>  - Eliza and SM8650 use DP PHY 4nm v7.0, SM8750 uses 3nm v8.0,
>  - No MST (according to downstream sources).

Don't trust downstream sources. HPG shows MST from INTF3.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ebda78db87a6..d06d396df4c0 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -67,6 +67,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,eliza-dp
>                - qcom,sm8750-dp
>            - const: qcom,sm8650-dp
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
