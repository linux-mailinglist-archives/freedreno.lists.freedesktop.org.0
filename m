Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNw6ED5XgmmISgMAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Feb 2026 21:14:54 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FFDE66D
	for <lists+freedreno@lfdr.de>; Tue, 03 Feb 2026 21:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D8910E587;
	Tue,  3 Feb 2026 20:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S642t2iU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkbSHTt2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0E210E5AB
 for <freedreno@lists.freedesktop.org>; Tue,  3 Feb 2026 20:14:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 613ImLwm2732739
 for <freedreno@lists.freedesktop.org>; Tue, 3 Feb 2026 20:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=; b=S642t2iUR5AEQuUl
 A9Wmq7DQIIixJkvaZOFqUe5Q9d1+7m2lb5eH8yJDOl4mLigYGuBRzP6zkhC8XqRY
 QmrvzlnTKGfqi/KBx4xhIfZKVp++naan53+qMz1CvdqSxc/Ew0FzePd0i98vASuu
 YqIF2U+JUmFGq0o9jz2v+Glr1tbC1Q5maGsi7J6ae1DqBLLIoiMVHJWg9dVq4yAZ
 rQUyQ556ofF8ridKdQwWLmYMUy1N+0dLUGhbSVeArisfoQcI3eTiSO8uBtDKt15P
 wes0p97ppVDPknIyLP0fBWBdwiPwdT70xhglEbDRE66F3FMMtsnjnQkWPbHrIRJx
 qz7TNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exjj0at-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Feb 2026 20:14:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34c38781efcso17980a91.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Feb 2026 12:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770149690; x=1770754490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=;
 b=WkbSHTt2sL+dis2v65cHkzFlnvPSW6GW9DuC5cMI8yG3B4ZzDppl3uQQ9bOIUi6VLT
 CUQI69V4lM/gv6VJqtYUpObPJ8FFfWr8Qsv0PAWhsX1CjoS0//vvTNGRGt/D4w39EHxv
 7CzLljo6f58RCJqLpvfXmIFbGJMHRR4kt9LylIbDIay0NzjE0Xh+c69SRsuxilMWdark
 d4h3KH01yGhc4pZA4CKIphZNNYd0I8hUMC2cNHBjMlZYPbpITuBL369+/bBdhBRCq074
 GrZIrky11Gji4kUB3ujXep1Th4ExBuzBmB0yFmBAQwPtBsjE6BXB/juiGB0AqhPDzBVO
 4o1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770149690; x=1770754490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CtW+VYHRGzBX6OvEGMQr1befivCX9DAV1/zlI/ei+2c=;
 b=iAPRVEB/7MaR+vXcC+6pfMMVqTJ7tnMwAZSEgZCfZNsIYV7jFKZdxcSRuQYo3/dlEO
 UFtN4vgip0FvRQ/GxpFgHQRmOEzBL2h1F4LqOoQYtmwiqbYH4TugjdI9ll/tGodkfn8B
 +K/LH+eYoaFYJmvVRRQJNHsyMAmL5e4wmZIDioa4Y+DQmooh20NVx2UD0xoIYkFp+HAi
 dkTFbndLmulRNhVOPdOon+Ui1HcoEhA2Pmha2KIfIeVMNkV3BnNGMGcf0Ci2q5rhqNNw
 dd+OtrlkZqF6agO8MFoNTsntGc+OYzfkC3aXkljuC1ePKnUp9PPsyLOol2LW9vIzY+BZ
 1kCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVl9GmSjWjweOguB3YrlJgaajkWT+/kbYavO8rK0BkTSxg5fOK4654Thab4S4IFrIEt1Mr6CFETjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZmGXiz/B0mA9b5gxOdhtjxZiZmosEl4eyinJSQXTcZ2J9WWQl
 Lr41qHe/G2j+7lYNBCIrkH47oK51r/Nyy4Y6rXhLmSmtiFxX34MVR5lGcaW/ewQ/MOjntb/iRnO
 7cXpEjUWtXod0fx+4V88PbL/52LTEyhBQCAA5dhgmuJElNxVK9LJqq4764BDALI1awWIPo60=
X-Gm-Gg: AZuq6aK9MpCd45gbFpDogNwPr8B1uXiFJvJPPIr1ohh4uLMyEVNm6j7RM7WwT2wN6Vs
 sfp72o+Fj1iYQ+9Pgq3M+EtGkiDC4VTzfofWjARE8QA9T3nvdEIX9rCP8FtMX/nFj5KU6VutrUJ
 /mmogqF2AQ1BZg6N6MMaKFeUDGPnVHRCUax8U4d3GOrWSusipoyYVFBU9K8aDx3+kZF8Jn4j/5X
 eVVBp1pyonjmX013SyqNeI3EKD1X9UYYGKpN/wNQF6SD8c6ZDuvgCr5KIzJHn44dphVC7eE+MTa
 b045u4NMLmEFTuH+pYbad7YoA0PWsOTblZitMb7sCBThp+uqL/e45z6njIQAahzD4yiWF2fuL21
 grANOZsBX1xp5OK6p7j3CcOPD6IZnJ/hbIQ==
X-Received: by 2002:a17:90b:3b89:b0:352:e3d1:8d69 with SMTP id
 98e67ed59e1d1-354870b1bb5mr334088a91.1.1770149689808; 
 Tue, 03 Feb 2026 12:14:49 -0800 (PST)
X-Received: by 2002:a17:90b:3b89:b0:352:e3d1:8d69 with SMTP id
 98e67ed59e1d1-354870b1bb5mr334077a91.1.1770149689371; 
 Tue, 03 Feb 2026 12:14:49 -0800 (PST)
Received: from [192.168.1.11] ([106.222.231.57])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35487131849sm97904a91.0.2026.02.03.12.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 12:14:48 -0800 (PST)
Message-ID: <86cc659d-f5d9-47b0-8134-6a4b11c99434@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 01:44:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240806214452.16406-7-mailingradian@gmail.com>
 <20240806214452.16406-8-mailingradian@gmail.com> <aYFJcxOXWpuuC41I@rdacayan>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aYFJcxOXWpuuC41I@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8c1lBWk c=1 sm=1 tr=0 ts=6982573a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=TQVzCM6xFy0bRFPZzaP6Sw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=lqJ36Ib93Mf7KDR35b0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gZWNh7BjRHjra64m1gLDSxPDK2tr6_jJ
X-Proofpoint-ORIG-GUID: gZWNh7BjRHjra64m1gLDSxPDK2tr6_jJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2MCBTYWx0ZWRfX5VWNBpsJ9bSp
 vHq7Gx1QsVhfiFJWz/2TRz5+LKpKi69oRWFNbfKZSqy9ANGhea78chHKdf2tRtI0hSfudpFR04l
 iUkpIB0Cq3lQQFjIZKCHxva7LdKLgGGxIfULl1QAHox90jPi7FGeW5QL2Dk6nG+tR51VQIBlYWa
 1ZYLRmXbstlQVH/I/GvZx/jXaJdyvT0QsPzLAyl0okDLrFkNP+FspuLyzTk/tixqCCbE45Wrl8G
 14ba6U5UcjC7LEUfU9oq0TekT1kKAWBqEa8TKG6EjrHImVq43FmgZrdlpaIdRK0rHlStcGkw98U
 OqHf6+fxsnOFdk1iEibGSzKiiTRoLE0VBG44ZArt+A2Nqun1ti6QvqNc+OIBfX/3E3LEwZpiZwq
 bOvQ6eRc8SZiWKLp8TEwv1Jz5/BwXOjDVPlBjV6ou8XnzDrsPvSznKbcf6uihm/7oYVkISr+D0Y
 jXfSpN5peVXMf2OjX8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030160
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:robdclark@gmail.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@linaro.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,quicinc.com,linaro.org,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 896FFDE66D
X-Rspamd-Action: no action

On 2/3/2026 6:33 AM, Richard Acayan wrote:
> On Tue, Aug 06, 2024 at 05:44:55PM -0400, Richard Acayan wrote:
>> The Snapdragon 670 has a GMU. Add its compatible.
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Ping, the contents of this patch seem worth including in the bindings
> but I haven't gotten a response to this patch.

This requires a rebase, most likely. Send a new rev?

-Akhil.
