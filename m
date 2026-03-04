Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INXZIe5BqGn8rgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 15:30:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC7201804
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 15:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D1810EA22;
	Wed,  4 Mar 2026 14:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWC9Fw28";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GclEK0yE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7242910EA23
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 14:30:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249smds1213362
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 14:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rh3ft9edmIR3MH+5987NLl83
 siXGjWWNjpTNPh6s+MA=; b=XWC9Fw28jkxty6vemT/FJ/4YZ03XfmeBOQrvZz3v
 aAUSKjC4LZbsJ2/k+YxEob9ZBzRyWQYZQgnH7+p3osyok8nabJdWaxbobYUJCQ/b
 CbZ4E/haNGWtWUQ1kdGCMcv2cnCumrb5UPf4U6psywT9Z0KvGuuGe9rSzv4ufcPf
 xG52Hx5ZxIkkdOxhGHImh6HbqZpj2LzrgkvvjJ3Bd4ilcqb45MhWD/kyN7ugdP5k
 whPGNvYZuCgDalh3Lvwm8Q7y18ehxpD52skdUW4Chep+L2OEGySN88IYdmyAOq9R
 qLL9+WGk4UpcjU9O29R9rXpeNd1E5S+yDHM1PVENzantuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rrxk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 14:30:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c71156fe09so4178907985a.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772634602; x=1773239402;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rh3ft9edmIR3MH+5987NLl83siXGjWWNjpTNPh6s+MA=;
 b=GclEK0yEDmSRsoeQN3Rtf0US1Q4v54Jt+ATmxXGq78WG2cTuWRx3mRa/nsE3Fs6PDg
 /SHM7zCHw1W/8o0kMAk3eLgvDcR8v7XqKQTG/dQQhgLFW/5eRzjXi/SKpyVQlmMq0QBM
 DUsWAP1YyluJpTK/IrYF90nJ6bGLgccAkCQGnxiEQjJZuuzQbxpMxJbnKeGmef+b84js
 CwQg5BxN/GMD3ZrW4nVKg7epd1wtSxyr2vurst9BKc7UG49HoNSGhY/GX4w418u5DaEV
 Qx0jqmGltKzugcDcRemWCgwrIuVbtNBYaiBs9ZtjXtsjxwpNwlDq2gXis31gvsE2ramV
 a+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772634602; x=1773239402;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rh3ft9edmIR3MH+5987NLl83siXGjWWNjpTNPh6s+MA=;
 b=jlT6Pb+2XedZjiIYyxxeL3x+pkLPDaE/7JMYiGK41YwBbn9YpXv8AjGb6pUSLMiAW9
 RbF0qSmMQzjWgwtRScbdvHVWHnuYCm6f98B3LU2vQfYoMlF8d9Om3+hxpkxx+3x+iCxW
 xnONFVtNGUWCz48PHC8x9EpmNh9lLe4Fl+zIGLaagktQXhPQaLTgUR9+5BQIgRBMrFLX
 Tm7+Ko5cKzDVS92ZpF+Rq+b9iYPP0S3S8OLBpCiyKSr0WsjguUWhiTiDz00Irn7VxnLA
 4QwGr2JcdwFFSDv1FI8CXK6s+Lj59txagm9+Ifzus8ToZ3QzENO86CV4u/C487nmGDKX
 6TZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjjpYABMC4Tfu6xq067XX7gHpoLytJw2Wa//NgmuhOEuthdNriSV8S7NWhL4YL2D6ZW27rOON4SxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykba9it2WMrEalQuOWieQZoAeLoJ0KEKauyGtu8nv4Dw69pVxt
 XJLAiq4XZp5QbpxuCfJG/xRLJaFtrdN/XgHen4fJ0FkbpFUJg1YW2b9FMkMZF9bPEuTQbgQfuJn
 eb4AjCYuu1v41MjTxm81ZAUBmI8rcZ4l7qrbNBbuKmYRowEwMpppR59zWhDitf/SstOzY7AM=
X-Gm-Gg: ATEYQzzBMHQyK8C2AAV/aaluCUvjg6J9BKGEgZ2vi1ZVgfSRF/xMIQ5fdmjYE2alwlK
 0IkblwUhjl2oHp2uNzunBvqERHAsFyGSnzJG1e8Fbfh4wTb/DVmir/rn5QP4CKwOoaPcPxIlxnk
 7o85ASVAAUDe1FNI0KGpVC3ckdS6yi4nZcCoxe4/VYAZLhk8gYwNkhpRI2p/Le6fe1Wsb4Hwisw
 kq19b3rP4Q6ogzDq5L9iuoc/Ba84cMfCCAgNOE9Rv7kb6445zeyQqsUnrqTsbpue80G6mlx4z9Z
 wF3eM0XM0mCve0ltgW16Pema54bwl0UiCaD4PRvEuuNV/NNs/J5oTP2XjvMMIlfhw2JTIJmlFEE
 BHmirKqHV/c27970LcLbkbBuG7ZUYd+JMHVu2ri/7vnB6YTMlsLGQLLgfkt3QhsGJUDaKW4rQCW
 M+KV6aAMBxJBaqRVqccZh9w0zvNChabdRIAlw=
X-Received: by 2002:a05:620a:29d2:b0:8c6:e224:926d with SMTP id
 af79cd13be357-8cd5aec695dmr274567785a.16.1772634601909; 
 Wed, 04 Mar 2026 06:30:01 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c6:e224:926d with SMTP id
 af79cd13be357-8cd5aec695dmr274560685a.16.1772634601387; 
 Wed, 04 Mar 2026 06:30:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12e9d091csm186828e87.42.2026.03.04.06.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 06:30:00 -0800 (PST)
Date: Wed, 4 Mar 2026 16:29:58 +0200
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
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Add
 Eliza SoC
Message-ID: <mru6szaucuqii2n5nhg3kg5kcppzhubu7xggzjwu4vzrx7nnbz@u4f53kr7tcqc>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-GUID: ifkibPzXjwdL6bf5c296I9436M-JV17C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNyBTYWx0ZWRfX5cSSePdviaDm
 YU6FxFsOBMHd//alb7XFoYLJrDfPw9KVXxHUYqhlYTEXtn+CJYyyc4T7rW+suw7rmuSszkq/C63
 NRu2wpPr832GW6QJUcINRBeSaFMIB23JkOOtPWUNXVstF0+xk2czrvv0SVQyueOYMM9zxF7V+Vn
 CkYk12bsv/VguXCR56nwhRFUQUqdltMJ8c38xC55eZVW59odVUBux+gm80rhVenII8WHZHslFC2
 tlsXWYuXpcoZavO8fC4TY47D8Ht3kBYyAqur6m99y3zXeO5jix0gr3I94ydOza+Jp0FsW4dJjPM
 2XcjkHKe4aW8peE/Ikp6A/YyQW3mc3ClKbV06EAYGL0m4fynwB6VS72KD4Q6KHckFGtAjt+1gXb
 ukMHX3xRTnnrw9fBOWtYkS3pU6XtvA0AXZReW81B8IXcag5hkw/fq7D70JJM1cSEJseplEhAEMQ
 INhZUWEyq3qPmI7kg5Q==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a841ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wa0heElAoa-4UX5PAWMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ifkibPzXjwdL6bf5c296I9436M-JV17C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040117
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
X-Rspamd-Queue-Id: EBFC7201804
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:43PM +0100, Krzysztof Kozlowski wrote:
> Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
> SM8650.  The device looks very similar to SM8750 (same DP TX block
> v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
> 4nm v7.0, SM8750 uses 3nm v8.0.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Commit msg
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
