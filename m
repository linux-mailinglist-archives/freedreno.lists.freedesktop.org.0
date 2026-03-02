Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOKoIGCNpWmoDgYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 14:15:12 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40611D997C
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 14:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7035310E35B;
	Mon,  2 Mar 2026 13:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8bQfL5D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h21RGewF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A2710E08B
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 13:15:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622B4Nkj3561558
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 13:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PM4arK3rnl1KKBaCYK+EZieq
 xuWI/d1NYN/A/QOx70o=; b=b8bQfL5DhG6NXqBL9GlUBBTKOpKHd6+7/JGdxk7c
 hBrIOAo0aqkVgVLs7NI1CZC0WZkLT+frPHsZiC22Fdo5EFiJ9h+ipnmBmXJTEZqI
 HRT9rJBjN/m3BkZAOHZsGdHbJtSR3UQnxuknLHiL89eLvja/u3j4/l9ZE12vJxgU
 dF5uyQm1P2FF+WxYH4mdGNHNIyZ/zNefD/ervcFifAcuhjpRef5G37bSOXr0Otuk
 fPeeOTiIbsnqmR4xPhc+51pYfK6aCzzFg/P5hGYeEnleD3IsUPhLxovrpyBoPsnw
 QjWqjPsBRIp8NZ+pteK/hXxJ3UAzQpDEG21/vr0bJQuEmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv8cm4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 13:15:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70d16d5a9so3125024785a.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 05:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772457307; x=1773062107;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PM4arK3rnl1KKBaCYK+EZieqxuWI/d1NYN/A/QOx70o=;
 b=h21RGewFT2M/5+BKJA/IRMUGiq3TJN/0EQKsb9kmKDnU/A4+0WAXu5BdpAAOvGkdkQ
 RuobYuL26qu/v0Mq81Na2f8g7LM5SvDjFLqXhZPOeno3J98BoIJdZd8EG2Yjb35gHlSx
 8EBWBBcNYeSoTVklQT1POFVox2wA0G6jRSyHGe2XfvHC/hPcJLq//d3kw4vGTBAseOs4
 h2bbMdlFa/L1HItznoBCSJ2Cajy8Iywd/4EdV8lxtZV38Vf8RTNxp20VwmpyR6coVP1B
 F1QsE3+AHDBvKgAGBskQOk0hv5mhnVehq7z8QifsTGxbFEX+xPLiEXkbDICSPRX4B0NT
 5VOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772457307; x=1773062107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PM4arK3rnl1KKBaCYK+EZieqxuWI/d1NYN/A/QOx70o=;
 b=LRZpSRwUI1tpKvyHP8dWc2u5GARltmrXEFQBDaK0iRqTaei7X79uqqCyi9zYHG7DQ4
 wA9de+dfqPwB2psvlLYWRw4CB21FXRjJre2kMyj7ndeH/j5cSoHWatE0jtC7NoG1JYkd
 Q2RarvllNSvQ1xBz92FTInjyQZJi0h/9K/7sMmrUzgFqwAKo/judZH4wtfvKnBmmMWgx
 p9ON3zCWk3PFdY34CMNf13/6NN6/HWvg9LWQNSFhFo0aNC5VRFgRFSwTmH9ABXLzfiii
 6FclRuUMMChUk4YYJ0gVHHlrqJUzic8fjO9wSPGrB785YyDcSR2E7NaptTG7mmXmCgHg
 X96A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIz0I8uEH3W30RHSwRTrgjg+lCK3sBGvxIMWF7CBMkgouhGnBtaqsdbmkILkAgA9frOW34FSC9sf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzviTygYuW8gQ1AflHJRX81d0M3h6kTlxDpNjAOSlKMFBSrR7G5
 L7t/0eAtqSGKKGuCQwNsGvevn7ime6o5EIBiLDbvCqkcCNuIIrFBnkR5oAzDRzlwWw+3ygfmSSH
 3NsGLYVdssL++g4L8OX1ZPa2w9zdPTPTcdDrFI6VVk4ZI9o0oMA5ed/OG0aTPRFJl03yidoE=
X-Gm-Gg: ATEYQzzC6hkI4rk/pJEPZ9DKXitM+R8MF4qqO7RW0GLQylPtGXuF0/xQa2f8rcvkOft
 hIuE+caUgUgmLczaDJ8s0QO+L3J1KjhxZAvLu0krrqMzd2PTodplKAi2Nh9GGOmy7PlJx/HFogE
 hQVrx6kTdfVai7oqzCXDRaMQXM1zNXln2Tu79AZtSmikjsokPLpbgiPjnjRPYxw453SEOjHRety
 lX1ElQnDE4ksSMDuc/Rr2//7QC7xcpaQOHvSKeH+j6FLEcn3JPvQ0cMwD/jXheAd7PfmfMXWejR
 bak+gfotTvT4+As8+L428IgS9f3ybTw8IOI1VAxXsLQrnBBeoSxNYqm4EOS2SKm7LDHJF/9Yl87
 NFfrY9EjpfPqi9AlO+Vbmpe5HxYtNltQxZptHUlMHVlWHZXtstbd6fGHJuENtjmog73xvuRgUsS
 4IDGgosTMUuBiQ9lJihJBhqQNtOl15vLlJxAg=
X-Received: by 2002:a05:620a:390a:b0:8c6:a26b:7e92 with SMTP id
 af79cd13be357-8cbc8d734e5mr1536605485a.15.1772457307146; 
 Mon, 02 Mar 2026 05:15:07 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c6:a26b:7e92 with SMTP id
 af79cd13be357-8cbc8d734e5mr1536599785a.15.1772457306659; 
 Mon, 02 Mar 2026 05:15:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffdfe5sm26831661fa.22.2026.03.02.05.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 05:15:06 -0800 (PST)
Date: Mon, 2 Mar 2026 15:15:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: Fix reg ranges for DP
 example node
Message-ID: <7b5fudcr6rgaey2a2t65qpyqkz5gsocmeh2jnvnx7dqzn7uq7i@aeeypfpsn7wg>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
 <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
X-Proofpoint-GUID: jal0-YbyHQfyEps1vI0QLU7ch6b3M0qQ
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a58d5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=B7jn6oKCbx1R8eWFqoQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jal0-YbyHQfyEps1vI0QLU7ch6b3M0qQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExMiBTYWx0ZWRfX7v90Nc8bc09I
 pfY16n+BUXzwJMVRXIXMw5HAh+GGvYYwHWUAfs5ugwgtNY3BQUH3I2NVLpveffWAP0g2RggqWpe
 jX8PEQUmZg/FU0W0hy6ZoYDgXqnPy5vAZdm0nrHY/sBGiePonk+RNo9RxnhGYXBZYfKMXihYuFd
 MC5bpZmE/DPZukLvhLmM0xb/qGCRzsN+gCaowD51Xq2LB/F9t67Oy99JHD7MgNKZfQ+miLdtibc
 fcC0bT33UI++8g90Rx4NALZ5fouFqLz6c5UhzW1rYrqmqc93piLOGCxqsyIVJWCrkSPWOsRaqDW
 AqPadXZDhlB/DmzVfEYrdqgquZwUIcQIGQO9Ra7UHvsJaUEm+B+V5y/DrOrQ9mMHhj8XOseDm4W
 fOs8TQ58cjfqiP/5A5HtzOliCPtXyls8otj+jchflJdbHjlYhFYHUpQHX99DsaN3KHvT6MGqTqO
 LOZnKCw7pvHq/U+FdNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020112
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
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:abelvesa@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: D40611D997C
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:58:36AM +0200, Abel Vesa wrote:
> Add the missing p2, p3, mst2link and mst3link register blocks to the DP
> example node. This is now necessary since the DP schema has been fixed.
> 
> While at it, use actual addresses from the first controller instead of
> made-up ones. This will align it with the description from SoC devicetree.
> 
> Cc: <stable@vger.kernel.org> # v6.19
> Fixes: 1aee577bbc60 ("dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,glymur-mdss.yaml           | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> -            displayport-controller@ae90000 {
> +            displayport-controller@af54000 {

Nice.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>                  compatible = "qcom,glymur-dp";
> -                reg = <0xae90000 0x200>,
> -                      <0xae90200 0x200>,
> -                      <0xae90400 0x600>,
> -                      <0xae91000 0x400>,
> -                      <0xae91400 0x400>;
> +                reg = <0xaf54000 0x200>,

-- 
With best wishes
Dmitry
