Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIMUDDbppmnjZgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:59:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FE1F0E4A
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC4510E822;
	Tue,  3 Mar 2026 13:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lar2b+rO";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDhDEwG7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4609010E817
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:49:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nIFD323882
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bKUr9vhN8IQ09P3DPCycLzc+
 1JH6GLLivTjRNxF1Uys=; b=lar2b+rOP5gcJ/uq8ArBlEzSzIRnZZfL7fwmwMji
 nV4zKlBycQE6WA4+McApxYdC1bQP48QLjA79m680ghz5w58ltluEvhIHM5mHSQSQ
 +BTrL3wJYkYW4kaPVuj/7D+ELSLdkbu2lrdsCdW2ZzWwwG5RoyMPZj5noqdrcLuF
 qhX8zdaMSsH8unIA2KIXJncgERT5zxxwnpHmbUqGG/4aBW6q0tPj9ZoSpsiGK5XI
 mgKxyABFDcW/tUMuFMkQoWMDciez16I3BKfAY3JHLhe5ZXvqYWjGNtzb6rWhLxse
 o1bvNNp89mh3haGy+G40wvwI3h3RAyJ7FmhBqHepyy5S1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfv95q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:49:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71304beb4so410431485a.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545797; x=1773150597;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bKUr9vhN8IQ09P3DPCycLzc+1JH6GLLivTjRNxF1Uys=;
 b=VDhDEwG7+2GSwRg/12xe5iCpnwBnFAeT1pzJFrRKg7lHy+TMq/KapN1BuEjSvA4s4c
 caTLC4NjqQsC0tT4I0n2MX40ebFZWr1aMPxx4mKpOdpvajeCHTyI/159HzhSC6GJ97Up
 9vaY9qYkVFd+3wQskZ2pKetGIIsgIFATM4sBT8AWOd45OF3eEaRw6DYKnsaQ6dO594Ha
 Fm2hxB9o6TrZAXVLrEeJhLVLyht5lqWgyQ2HnrZb7sz1ivLU1BqKOp69QyE+XK4EndpY
 iqpgEO4OIHRDbcE4yUEl28M2VTczhv0GLy7+f9jgunMX2qnj0Xph2We2lU3BB+vQokmg
 7lDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545797; x=1773150597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKUr9vhN8IQ09P3DPCycLzc+1JH6GLLivTjRNxF1Uys=;
 b=JPObaiZmzspJ9S8rx+NbEstuUBOHttslPL5A0sDlTjrewqLyFVNt4ecYVHnXVMI2P8
 yop0qjiToMuOiLmz56jc1z654ScPHAJB05eRmXjkpFZbXBgzXT0z+jhTLKt5FUcL6I8R
 TYP3mwFmol8wCXx9sc4aU/XQfsa26GPuhjVJym7MgWW2A5qtBJMSdg8BuffkOrrih28C
 vAPuUsPkQ3a405hr2u34b/+Ffy+dItda5E21AJ8qBuMLKZOm1U1UkADJdMdEPNfEv+v8
 GLkOaM44C2kMOYEVKB8x+8uUM7+6R7c3c7JHJglez126uXjFoXsd0cdv+g6rmL8g9b3G
 KkKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Pd3IJP0Vk+PCpZUIh+5Eb+SZT9uP3XvnX1I0kVchuuMXOwN5sT2kBf9pxf6zCbOO4ez438CjG6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ7iXd907qoBqNjxbDM6z7Y7t555kuiglCkD6voNsm5zt5oVgX
 9mB+dWRuWNODLX4tmK0WldrjlxJx5Jo8uJFNdPczEQH0dArZWDAT2rJflTKshNOghYdSajaA6w4
 GOVCdDomCspr3R3cULGZhf8CaNx4Kf2c5B2ggBGDBVqRQ3x5G6O6trALbmE0h0AXc/wubtiM=
X-Gm-Gg: ATEYQzy+vjAGnB7X3zjK1NbCF1RgFXGVRsOWRM5NHUVSmH4ODAh2zR7jr1I/OteuuBL
 wHc/ubno9cmbkjwX5GRSMoo5q1s19CFTSboGkd+aGKRfpYx7Rc/O6bqiKRYbJfOSpIoW5nDI9mj
 zlqCdbbeDSxagccPCyvYfr7VAQT05q01VYTmEjzaRiHkua9RSEul6Es7mW77ZoZh5fQ2Er18HnX
 XN/1Egk3kKNC+XrQJXjKydfTD65hYRR/ki+YmaCSsc1LCOaiG7Zpv1xC2QwJHksRwNdBFwdS6Dm
 bUoi3KricUisFkuy7JZOkUmUHYANf50yneijJTnSIr5w7ukasncxlaeXVZ5mIrbveTR7IC5C0/+
 nkIsphTw128+bW4II5b5LxHz9FB9D0ayS8qbv6wTcYgkFatYnADfXkTTcjAyOQO1NI+1VC45n9t
 8wagcVIK/gs3UCkCZPeqrb1UCx8UzL8nUFSww=
X-Received: by 2002:a05:620a:3703:b0:8ca:7b14:16d4 with SMTP id
 af79cd13be357-8cbc8e2d0a6mr1980984285a.63.1772545796788; 
 Tue, 03 Mar 2026 05:49:56 -0800 (PST)
X-Received: by 2002:a05:620a:3703:b0:8ca:7b14:16d4 with SMTP id
 af79cd13be357-8cbc8e2d0a6mr1980979285a.63.1772545796244; 
 Tue, 03 Mar 2026 05:49:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12358402asm577665e87.15.2026.03.03.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:49:55 -0800 (PST)
Date: Tue, 3 Mar 2026 15:49:53 +0200
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
Subject: Re: [PATCH 5/8] dt-bindings: display/msm: qcom, eliza-mdss: Add Eliza
 SoC
Message-ID: <acy42ex3fcf2owpi7fbu33h5evd35wcprdtlr2ipqoavcacsl6@xmf3jd45kbdy>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-5-814121dbb2bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6e705 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=1rrVjcLOA_pWW_QP3wIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: s7gLR4qMtQotpkxk0UZphBoz2O_07mI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfXwat+H7tLwDiA
 RcE/fiFClI0F+3/SAaQO2fOeuBwM1MkONYsTXiKDnjjpfBFNgX6HZAhsW2L8k76HkHW/bteeyYm
 xAihjK8CBCpjj7DHE/A+RbGlrYiqbCOn2SRR5zZv7IYRK3aUYBMpPQ/AYekrsps5Cfm+dsUAKux
 ksGgaVVrkItv+nsXyhqjRAVKyV3NT3vFesa4Hq8S50HTG3iN1img/snbzciwJdCvGolsRhWH80O
 WWdcx52VKHKVGsk0utG21/Omupa/dbqJQrKwjMItcPnLrSisNzlUsRVszPWpE2O8J8/gARh66ab
 pp1sy6CXd+Ua6eXN9maxRhnU0k0IcQ87TkWZ1LM9iZ0MMGhn5XecVwQd2edzbB3miLbncabdxhT
 iPDrBdJKE/+UECEzOevriImdjZfe+lWTS+hcWWSCki1C/q2yqK4JeihRr4zuk0X7oiT+TM0EKwq
 B614dYHV611UOlihCCA==
X-Proofpoint-GUID: s7gLR4qMtQotpkxk0UZphBoz2O_07mI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030109
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
X-Rspamd-Queue-Id: 8D5FE1F0E4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.897];
	TAGGED_RCPT(0.00)[freedreno,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:55PM +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm Eliza SoC, being overall a
> minor revision change against SM8750, but coming with few different
> components, like different DSI PHY and added HDMI.
> 
> The binding does not include HDMI description yet.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,eliza-mdss.yaml      | 496 +++++++++++++++++++++
>  1 file changed, 496 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
