Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LnrEOrrpmmQaAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 15:10:50 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA71F11E0
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 15:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75410E823;
	Tue,  3 Mar 2026 14:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjgKTAkh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZsj0jJz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CF510E047
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 14:10:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239n2KW2736774
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 14:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qR5GzbFJ+dMxU6WWcNRoCJ+Y
 aJmi6VfZZWkl7xtr3Y4=; b=AjgKTAkh1IrAwyyKPL9QxAgZvl2bB3RYIP06DhHe
 f8/kJngrKj7Q5QYcMBL5Bbr4AjfVmKZIbKXJCfDgc5ZOeJHBe2+kuiBUA+FmB9Hh
 xkqNr/FAbddtklvIlFHhbBhzOh9y/nR5lHYXXkz2DDMzOQcWKr5/nCObXkQSWIK6
 qr5GDxmKJOjpqhKRzlyWxCCeszcm0bZjNTyDd+IFG+W7Tc0ZZ0Wx2aDrAtL6fF8U
 5M++w+R3rvWcOLYWZfzUhbL6bZZZWff4Py/HtEWumsNJ5mCs/rZUZjEaGgAE/IlR
 Z0+ap2GX9m8/QbWWFebQUeKimFgjSCIRjpiVK9FjqX9pvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe1hsx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 14:10:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c71156fe09so3732558885a.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 06:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772547045; x=1773151845;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qR5GzbFJ+dMxU6WWcNRoCJ+YaJmi6VfZZWkl7xtr3Y4=;
 b=XZsj0jJz0QNfc3Cuo92Y0g7UtObsMEXcPB/g39IpKjLRm5Fcx2zQkxgZEAEnFYH5uV
 9OaevLfLXifh7kfzvnIqHEFsdcYeMMbovWp1XOCH89vqBxxkiuNysnmBW/jzX05gGUf1
 unFbjoZ9f/cI0gsfb3n+Sbz1cvrCPrqP4iZCNcL+r5MRgdSRCPQbiLU9+vbapGL0H6bV
 N3KluGm5+2sNv6REKwqpn4E7/bXUoKW+WyORu4gUTn6oOvDNETDBwx56dwXMrylwzhgr
 j2WCmWsV205RAWwo+18dunIoR/y3Bm3Ba5JsvPJIRIF6PJO/9tT1wNWq4IO/lOauAcHR
 knpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772547045; x=1773151845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR5GzbFJ+dMxU6WWcNRoCJ+YaJmi6VfZZWkl7xtr3Y4=;
 b=L+LQtanQ1hGsdkIJDHW/0IHg3Tf9CryiZYqSK7umSmHHmrJdqCFWJC4mFGYnTGFfG/
 aFdjXxu6ziujq+/fs/LzO3SR/vECnNzqiJEKcFvYQrFlG1m2QBOii9c+4KaYeRIjAMwG
 oFju7KmsacXnB+owE7bZbtoSF2o9L/acStHpTZLwwtJdymy+5pbo3lpMFrQpiVgXaO/D
 mSp8hMqAF78p32+evjpjzvzQqw/axVcSwwPoMapXXqFHvOrLXoJ0MCkcdRO48cQi9/l9
 RMkfp52xxA087l4DHEMh9nik2nKMv8qkrJ3VohZ+B5fD9XRBJBrV1ZCzmlTj0Pm9bDW2
 h66g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxFuoEjDVnJCZQNt+I1vZhKXgOR8Qui8Gr9NUMLk9EqMJ3+DsZuteal18Sc6yrqD2aNem2Um1IK+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+dUN2r7e0lM9jRJwtj2OY6UyUHBuWdatSLZyPai70wS2fY+Vq
 zXuEqw36w+wKP2rS9SpcfeomF3R7o+0n9tQLzF/2tPb7tc+dQ/7DklJ/sSQgEwGpAA5sHgRhBhV
 7M6AtOH6vvWRhytVZMi6Frs+q2D1Q0NA9uSLaTKCW9waBd4LUvwPtgW8w/8rHDyhoixZANFU=
X-Gm-Gg: ATEYQzx5XJDMciE44D21sS9wYLA6eDcbIM66Xpl0oAenHL4bOdZ0shIXUmsHPKHsQZQ
 kHkWfXZBdevQJfVTdfrw3cp2dV2mIH7D/sRWyiPoeWUdtvixGr1gE5ifeTAF4Xh1/CNEJ9dzrne
 xaWVrr+RFZc6gBPoj69Qc8yd77+DdO4VeVfBTMXsErKun8bACY+srytFJRWX/JsWi2IWTJQTanR
 7Ggsu9lMZmb7CLAtRPb+glsl7UojQvx9RX8Ro/X75HAYM7uQ8Y9laYp+a7wyuzWYvGttjt5tsxg
 z6YeMlnBPGdA+hIazy65Moxp50ESzo58GR9B0EgNLobhv/tuoNpo1a0MaPtlM4svqq7w2NCU02+
 kxC8l8MjLjYVYrANS6Wjzuo4d4nTnGmxcRYrrvGCVcIVox2zvI8zJRP51t48gohEDM++TQoWIYX
 EZCAa5tleSOMytuwnuq/B0K6XOvuy+AxTKlTg=
X-Received: by 2002:a05:620a:2906:b0:8ca:3c67:891f with SMTP id
 af79cd13be357-8cbc8df1c13mr1927062185a.46.1772547044823; 
 Tue, 03 Mar 2026 06:10:44 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8ca:3c67:891f with SMTP id
 af79cd13be357-8cbc8df1c13mr1927053085a.46.1772547044157; 
 Tue, 03 Mar 2026 06:10:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123581491sm610722e87.25.2026.03.03.06.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 06:10:43 -0800 (PST)
Date: Tue, 3 Mar 2026 16:10:41 +0200
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
Subject: Re: [PATCH 7/8] drm/msm/dpu: Add support for Eliza SoC
Message-ID: <7hwaqdfopuptvjoikc5y5jm7lf6pr556k2yijcac44fobt3x2z@5eglub7asuqq>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: W-h6GB6tgV2rOjxPW1Cl0I_-ZzDdBaH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExMiBTYWx0ZWRfX9lO6yuvEJ+6M
 FUyhObeVkjUHixVysmYsb+OMgu4aOh56TcLD4WF+yXwNb8qMk13BcN25QZEaDocSSbQMuY9/OP8
 y/viuUHlHNX3jffl6ZHfjTj5usGus4c7WpPuc1ez2FekcBErMrKxL8EqnK1x5mL5qZdO4mYelAf
 uWWGE+qTsYiTp7BKKbtMgA5IpZBR22GQDK3KWKUQaRU1ptFWvOKlLNI+1IxMeDsRV4Cx1MEKl/n
 qk1o4MpyyWZ9lnvW4QWTANofmfTOZs8RCm3iV7ZXRYKefWdKbTMZw7YvWVYcnslMj529MTrkQGJ
 lM8ULW0+94HAjccduYeCBbiQz1J/+mwz0SaT3eJyrZCCIpvKek88IVkOcOzgHIiZxvVspDiFdQS
 eXc65yXYejedb+0+l83JvQJuNMiQ9Tj/axjLqwvUIFgi6u/ltAXeYkgsIlRrkQd9RSB5TargDil
 MbVbXi4aZHBBcEdmDhw==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6ebe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zHWNXANJRpzq94LBRZAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: W-h6GB6tgV2rOjxPW1Cl0I_-ZzDdBaH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030112
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
X-Rspamd-Queue-Id: 49BA71F11E0
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:57PM +0100, Krzysztof Kozlowski wrote:
> Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
> incomplete/skipped part: HDMI interface (INT_4).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 368 insertions(+)
> 
> +	}, {
> +		.name = "intf_3", .id = INTF_3,
> +		.base = 0x37000, .len = 0x4bc,
> +		.type = INTF_DP,
> +		.controller_id = MSM_DP_CONTROLLER_1,

There is no DP_1 on Eliza

> +		.prog_fetch_lines_worst_case = 24,
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> +	}
> +};
> +

-- 
With best wishes
Dmitry
