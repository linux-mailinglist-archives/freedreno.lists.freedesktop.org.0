Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ94G0fepmnRXwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:12:39 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515231EFFE5
	for <lists+freedreno@lfdr.de>; Tue, 03 Mar 2026 14:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD82710E7F5;
	Tue,  3 Mar 2026 13:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3Mo5MBm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mknmvtfq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6D610E7F8
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 13:12:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239nHFi3349620
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 13:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OBWI+40eaeQ+iw1M/4292kYBLJ2INezCodN+3KzKa+s=; b=P3Mo5MBmGfiAkfnl
 6WTNQqjOC0QdjinEsg8u6+pYd9sNN0zGGNi22hEaCzrmMm0CMlbYMMk+amaDVsqx
 JpvOC9R+zoekvYQ3gbG1U3nAUTzz8YPk340KBh/u4o/wtrz6XejctE3F6ETWrNVq
 JzMg8cFOCIArysS3n0Vfg+ECeXA7/AfISmwfzFYeeihVN4zu/Gk4pjkX77CL4xEp
 5xelraXsic8KDVrop79fzlXVZ6rICAaGlHFewAsZAKnRoBUchnumy/konkNNZApe
 PSv1a1Hr3JtVO3MrANMZkd2ZKQULBFA15uwWWYMFeCakz/Ktd2GLZ8jbgVvgTJX1
 M4S3mA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsav1t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 13:12:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb4025302aso431326385a.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 05:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543554; x=1773148354;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OBWI+40eaeQ+iw1M/4292kYBLJ2INezCodN+3KzKa+s=;
 b=MknmvtfqxOer3MaIOpztD05blUvsDBsxRRla5reCVGKsAi1E5CV58DR3Mts27YJg3z
 cb46MyHxy8wip6248H3TFnlt9a7r11sspFbX4dVMmgioxRgfqRgJcDCeCnXwn//NRiVd
 59Q4N0ztDjhKHPrGa4SyUHMz60bZQNG9A5WrckO35ergjcnlN24E70xRe93aj6UM/SJB
 iwnONH72JlUivUyyOO25zXyELYH/Z+0b/RPNQTjmHOsPCZSUnR82W/yLd9E5h4JNcrnj
 +20c3iCKvp/v0kXG4E152vq9HbuV9vizTlpBiuDagWczupUUfqczDC9xeJlULJd63HM4
 mVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543554; x=1773148354;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBWI+40eaeQ+iw1M/4292kYBLJ2INezCodN+3KzKa+s=;
 b=Kfxm3EKjNOrL2Ir4fq9uK0xe8YV4AlESgo1rLeiVXZVtzpk5OLoOmboqYPho3DqtJ2
 o/43UR5zLyv9c4+PD4uJ6hPoFbNa9j5p1zeOJyXqISOHW/FZ2z/fyy/iV4XFakcu9Mfe
 jbUuSOAno2laX0NWJzoggzdj4t/rXgEER98ZLwrgxL44ufhckHNU2hT9t19JzZEuBxVQ
 0J+wIUPCS7ByFks30qW6jNB7nTN72tAjh/rdZu5/jJleUmT+9BhNvP7os99Oiy1mARUx
 oX4gLdAJixRKqvGs0bpqcKdb7hXOoagjpwpA7g4ftb87/1URKcWUPat09uyFV37K/Hr4
 zYEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSspptias1cyW/IGc+nk+ljA/ykBEXinno0jGKpVMcfvAYC9NiTdQQT0H7LpLzBW6pN2rdoLZXvPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEop9Ay92FV7FQ4Pin2V34LVimiIqGb3lDny9CGmUdyF51aac/
 94zIGrd7MROp3o9dsIKxjSKJLv4qsXwtwHTmJAwRLMZzrMkzxKED/A/HU9ZBo6UF7RRnKxxFVSJ
 nIr2DyaMrD6IqEgyd0bu7tPj29Drgl1yJc8OvLy+crStzcjJV5n5/eXAyS6Q493XOH2UCCgE=
X-Gm-Gg: ATEYQzzxnuZTIfFLRAtFvUPYnKV4OUyrTaJhA5ZIaaWQVUEYykKmeXNDzlBkDFbXA7N
 EnPsHBgvGnMKadQdQJI6FMXmBApSzSS4YtCSJsCswva/CQNZYUV0TsInm4JKz/n87M5JfMJ+uFL
 bMiqj7u/aRNwodqmyDam79IOZONW4zMIE9XmUYWN8on39R3wu4E8IEEIN1oR3k8KEyoVFlKSme9
 sAdTPFa1i4KUrjxOvHEFpXj+Ype2m+QF2ePLf4aX1FmUs0Pzwqbg4jQhcrAeoJzcifaXC3HcW6+
 hqqxeD3yafMpy7gl3kr/O+W7+k34AX+A6Yowkzp8Xz1egL7DujjbuNf52awie+5Ol2ow9w5rsW0
 pK2UFCktCY0o84MSXAHvFgsJiwnKnGC9d4EgsM3FPgAQjDf8ZLCJ8Ab6Eghae/M6DAveuJK3Dqz
 LO/1s=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id
 af79cd13be357-8cbc8f467c1mr1582097785a.10.1772543554074; 
 Tue, 03 Mar 2026 05:12:34 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id
 af79cd13be357-8cbc8f467c1mr1582091385a.10.1772543553473; 
 Tue, 03 Mar 2026 05:12:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-660b3aaf0ccsm374461a12.32.2026.03.03.05.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 05:12:32 -0800 (PST)
Message-ID: <4454f8f0-7be6-4e9d-857f-b484210a9359@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 14:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
 <20260303-drm-display-eliza-v1-6-814121dbb2bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-6-814121dbb2bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r0TcZmKk8kocbqRwtfQVlZ2-yuoP9Kak
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6de43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mbR53VIhkaFObWXl9GwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: r0TcZmKk8kocbqRwtfQVlZ2-yuoP9Kak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNCBTYWx0ZWRfX3eXgGktJQigz
 ZCxDHIULsEzhAA87vOlAtq+QhRg7VNpOQhO3URQXW42o6OE6jjG5qpMBMiWBck7Ac4cMdNixZR/
 I//K2aLAWafuYvzGES2c2fxqpKgvWf1mnYaXBLTp35kRHFTySqpwMrBU2QEqM+4BDVO3YOSS9Vp
 DaqO/had+OklxmuM13GQ3BNB8rwF7IJGL/raLXPOgDk22xzXWRo26APd6D+4mO3B82k7+hv7/kO
 uVxMRUh2Yo0D1zyiOFhLaOpHjt3OF4qBjKKmwwJI29bZa6Z/Tp+SEZQTGzkAte4pEvy7JE8O+iY
 B1AanD++JrJNOh91IOyOqJrCA2xIRp6bhoWJ47CfrbMyZXq/FLv86PqPTK4y8jLjchBEnjZ4M+4
 XwwY8kff9YRvlqSTDiZ+MrzCoeynQc1NVLdySIcoveQHJ2DyVKMG7AM/0Hh91JmPTzKgASaApNr
 cFdC/VMav2Q6tAImvSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030104
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
X-Rspamd-Queue-Id: 515231EFFE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/3/26 2:07 PM, Krzysztof Kozlowski wrote:
> Add entry to OF table for matching the Eliza SoC, using same
> configuration as SM8550.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Eliza is UBWC5.0, unlike 4.x on 8550

Konrad
