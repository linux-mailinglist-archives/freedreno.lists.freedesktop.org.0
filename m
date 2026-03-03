Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMsVGjfppmnjZgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:59:19 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035411F0E59
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F102F10E82A;
	Tue,  3 Mar 2026 13:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="irsBFP/H";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXeUgZjv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84B10E821
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:49:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mrrR3099636
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9qTYU08p+T1/fcxXhU5ojAEg
 8g2sM3hAogy14uVclO0=; b=irsBFP/HEFrmEibdtU7XU03+cBf+XO15fNus2Fcb
 Ks7SEXwMWmYCO5nrhIsorkivcrIVQmw8G+QLZ5tie5xr4mEgLj/rvucKjyFLSD7Q
 kuxsbzZMirf3NUy0YVNH6boxb7J3IASf9UOSe9MR2B0xXt2S9iSf1PESnviSUXwD
 zYQm8vl8lz6PReE283y6z73TtbBhwgUe6bvhOs42mFNklry6u/xEpbjRbEk7SW6X
 Bmvpz2Rzv8y7gVyFy1WO8eHYwQzb72gDFdbdufM9zAbHB4CPhm8mk2rQZC+8Wg4e
 sIqbbtlxyiCfzfkf/9gu7B4xGcfrIDroU3EqznvmJV8YSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu12uj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:49:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so4181348685a.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772545745; x=1773150545;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9qTYU08p+T1/fcxXhU5ojAEg8g2sM3hAogy14uVclO0=;
 b=NXeUgZjvfsFaXdXTY90qtF8MRDQNeDbHq1DluxQ3iVQ5ikFIC3y9xshMgV0rA8I/b2
 U/N4xE3N9E1/sKfQt421YJPtvxv2bgpdBsAcOesgJsrFR45XtILMrcUox4EXQJ1jepzd
 0knD2bhSob+vUSGVqYQ1UhSSe5T/pkr9MHQMzyX91Pkwu4xK8lWjgdsDVqjMG0bGxOTG
 tX0gMgDIulssYsYlSUa6FIdzauNIzYU4omX2FJvUIOGfG715YahojssR2kKQWTbYnuoB
 yFs0oWkTyAScSQj9q8FARBmcjME2GYfvfb3iR4CzEOxZYW2a8WoqDpHxjePPLaK47owM
 q2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545745; x=1773150545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qTYU08p+T1/fcxXhU5ojAEg8g2sM3hAogy14uVclO0=;
 b=py0aeDJUTATmOlGe5rUwIb+FQBPBw1O2qlKuvJSsXnxOyY9VzaFQCP5t2SSi+nHx79
 fwjS0LvTQ5kiwGJ/6hNoHRtKzI7jCgVIYXGVIL2sEz6TXceKDEO7xLqMGZB/giyPmsNT
 8vsSp4PDlMDn++WY9BroXbbmNXZv0Qlczn1PKte95vNgI+eBzHNhVqoRWXTeTXluGCsi
 ZiThbO8uK5yTKvw7Em9M1c8klknINiJ4P7y4GnrYQ+25k+Vp/Mj6fETh7TDb8g5967mp
 o6nbUcSUc3aH4w93/Msa9mzHUPTQhXF5FBvwcUJmgVTgGSGxsRa8RkV/iMxzbqNR/7Lc
 SQKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2ogHOFYe5EA0P07RtuzrLqe+RdDPJEAVlE3r5/j0Uabr+YpEc8jlB8XPmumZ32FCes74bHbBl3fE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoB9iO7VuIP8/xZud35l28+tr61le0yz728yQEoo1Zlna2Ybuc
 DjcGUhlE77KCnGcDd/X1GwHOTGbpSp1uNTQ1dwb0EVRJ1GBrUV+qKsLb6uN5icioccgc/bf4xNn
 79iy9lBUu+Tz1pJR+1l7zlI6f9TxCXQJjwd+D5gRBSIhm5R+QeILFDu6AxSjP8iCaZO/xYmQ=
X-Gm-Gg: ATEYQzzYlmWjN8A0WJ9XXywZQmGpaf0h6aFnx2vg5RRbw9qihx6l/lktCCb9qfq/Juw
 agMk/3lfEGOpvtEk2fhn4eRO0Jz7tryKga4TNiyMXYte0XEHjtRYClKdj0HbuLS4oPbhj3Jk28C
 ISPbMyC9YXZbGCLHXZ1rFRFeuBVmvyqAJ5N8b4mYIRrzQrlaFCnP/lt3mmx8nYejWNtWM0FQvtk
 9Toe4m8hQDYNoL+iN0v/tciR8NCAMzSnkM/Ly83Fm5sYlZ2be4PZXYH51zBautAifeeiXy5XPBs
 qPl6ZgBxK3hxpqhemI0CWetkUhcSpSbha7/ZLtM0uhxyaSnfFhsq9L+25M8g1t4a3zJ86RLJp8Q
 ZDLq0MB7rGGO6ziI0nTRwGOnxXpJd86/T+Y/4SjSQQKOTW/QFuz2/TSRASNdjMzManEsDClLi9W
 jTwWcIFqodLhNgEDyJ5EhGMYASSGrqZvmvT5U=
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id
 af79cd13be357-8cbc8df0658mr2155304085a.44.1772545745255; 
 Tue, 03 Mar 2026 05:49:05 -0800 (PST)
X-Received: by 2002:a05:620a:1905:b0:8cb:3505:443c with SMTP id
 af79cd13be357-8cbc8df0658mr2155301285a.44.1772545744808; 
 Tue, 03 Mar 2026 05:49:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123578ad6sm607700e87.57.2026.03.03.05.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:49:04 -0800 (PST)
Date: Tue, 3 Mar 2026 15:49:02 +0200
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
Subject: Re: [PATCH 4/8] dt-bindings: display/msm: qcom, sm8650-dpu: Add Eliza
 SoC
Message-ID: <hdwuintcfv4leg534qedh2segu6vn7fhdpl75rddwns3whadvo@n5jaqp6ea3sx>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-drm-display-eliza-v1-4-814121dbb2bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a6e6d1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fTnWfZjI5X7wAvt4R4YA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4w5IBxFMmKQ4-78CfKKn1B03HMymtcih
X-Proofpoint-ORIG-GUID: 4w5IBxFMmKQ4-78CfKKn1B03HMymtcih
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOSBTYWx0ZWRfX755Awn20E+0k
 8rYhgbEPnhdpUSrkmy3xDEPTrgYYcddqy/x8BA/1HJLesYaxcmIPBptTz/suFEg4Pw5Ug4XTIVg
 cxQ6vMT4l5OBn1rue6xeW3M/I5SYQWy7XvvbJLUKB7Uy3rs9iwvIkpgwnC3re5KVvFbhrkemB9R
 xdz1CRs4iBNIKWX6/QyXj2cx+7NwFit8MWeAQx4UFkVMUt2EgXZ/DMMSimdOb15esthFxK19zmW
 Z4urPsylCmzKRgK1ArhDYkCRL9S/4K7ajYoexij6AjBSi5WqLwROQ5zlkupdu4TAGucKACPtKJT
 8DnW98mQzpVbZ9qVB/ZJRmcI3u2ka8XhOjeO7C2VLGrjhwHAii5PttO6oYMhFqjdjJXwGeOGcLA
 +5RK4Z+VSJ39WP7KxrCPWoOLqLlTl5hfDvCEkwcbF1ta1XO0MjWhEG396NlLgSA4rCmjL/6jll7
 StWQhda81lvwlRDbRDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
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
X-Rspamd-Queue-Id: 035411F0E59
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
	NEURAL_HAM(-0.00)[-0.906];
	TAGGED_RCPT(0.00)[freedreno,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:07:54PM +0100, Krzysztof Kozlowski wrote:
> Add DPU (v12.4) for Qualcomm Eliza SoC which has noticeable differences
> against SM8750 (v12.0) of mostly removing blocks:
> 
>  - Removed CTL4-5 blocks,
>  - Removed VIG2-3 and DMA4-5,
>  - Removed LM4-7, DSPP3, PINGPONG4-7, MERGE4-5 and several DSC blocks,
>  - Added HDMI interface.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
