Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F169F106A
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 16:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854FF10F04D;
	Fri, 13 Dec 2024 15:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLh6j38D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0B910E43E
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3rNB013167
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RUGCbElRfwnoPpxFnu1ETCSpv33WWX1zIEDuWigaaa8=; b=HLh6j38DcQ4ou29Z
 zg6t44nmuDnYNQxPMmaXJBMdzexH+BRyUCloz5+QbUZtcZzjva0PtLWusTMzBBQN
 eMN+rPhRJ8xcH7OhDpMmb7zgQARiGCG4LD+ZnKxer8L27lwrfFFpFqjJaZ9y8iR8
 Kt3IVUxKXrVmqLNvaQTxddrLCdz7n0CS/+4bjbd+3ui/lRYjYvEyTT66ozpNDc8m
 ZrCzSMT1+Ew/vCBPkkCUlV3h38gdNDaxrVRAnTHyfpTCdH/8JqR1IpXy1EeS/g6L
 pJEliXfJMHBl80edHXPefAxe5h6jYn6WlYnpmRtqwfhEGxs4zWXguN3rkDiwQNBu
 jc1fgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudgusf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-467a97dec51so1609741cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 07:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734102588; x=1734707388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUGCbElRfwnoPpxFnu1ETCSpv33WWX1zIEDuWigaaa8=;
 b=FpOCScs7MrW+o0Pax2AUl72v0xlOF7i6zzXKQR4Cc0jZ40t/xA9uwOdqIXRStbiNpY
 HjcjefApt+r7lwJgwRcTfu423HAE5iAonhcyWATbrQUp8nfHyPZYsCIXiCzkiJj9XkNI
 JiMBlk1VSOTtBS7g58tbvkDlNo1OM2e8lRncxFxZyRfEY4JaWRIaPsgDsJn6y3UwTYe4
 Iuf5rMWxPn10mlzOcE8sRFIsPVlpM0T7WzPQggr3yjnM3ImtJVRZcA94Px3CJ430QCL5
 ARTQD5kaAcuq7L5A5dsK1hVOSIy2moH0HqeC+ARsSxzdXWFKCWnK8RmbqzeOEjR7ztoJ
 78sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaQ+rTPVfPuX9KRakOmBzKWUF4I1WDJTyYQrjYo4l0kf44E6uSAt//5fqaGjp8dMtmbaXdbh2ry00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUhnoY6n6yZOhp4VjDyrpn42lfU6t2O8YK+nfBGzgzXyblpsHq
 gL6DYQL/qwzNKcmmNo66s8ScPERzGm8mFiX9DziCsy+qIVlzvbNfnOub5BxK3zd0Rl+AUjL1rvK
 vnUbKtZfZVgvqc9NnWN6/LmQ+b0T1LCvvveJE3tMORuoT4mQSlOotuxnAtTMR16CDg7g=
X-Gm-Gg: ASbGnctu1w03twxpdtMwk4KI+OJUZFhcoR5QUfoNqrAOFTITnNlFDHLMWjUV2Qvp8e5
 binF6K4+rTKIZRVWzuxMNDB+eIyctpax7aYpdwmJvBnPTh+su1AXmPWdEWu7vePjxqZ+d+J/yMZ
 3oh0g1ut8J4/hZlDdBmjRC+8wEeKmnBLVPTuLIvkjVyEZ6IoNBlSQa8avtXNBLN1B9sdfrpylul
 ean8NCw34wHAjcR3ce7+HG8rkomWM7ahFll01m4mDOJlj+0gtqXO/GEuOCgl4GZjV6qRCVCsx2i
 fEAstyrAewm0SqgQul2qI8Ni2DZtjWuvvIfK
X-Received: by 2002:a05:620a:2993:b0:7b6:c3ad:6cc4 with SMTP id
 af79cd13be357-7b6fbed9855mr159798585a.5.1734102587827; 
 Fri, 13 Dec 2024 07:09:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCNOTuH/JeSKj+950krsW+duBDTSos0kfQOVpuA6pb//nTscPC9RvF8gzspY+TD5ARI2Du8w==
X-Received: by 2002:a05:620a:2993:b0:7b6:c3ad:6cc4 with SMTP id
 af79cd13be357-7b6fbed9855mr159795485a.5.1734102587439; 
 Fri, 13 Dec 2024 07:09:47 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68770c481sm708781266b.110.2024.12.13.07.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 07:09:46 -0800 (PST)
Message-ID: <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NScUnnUQ3zTyZvCsEBjlvST7pzTmcTGZ
X-Proofpoint-ORIG-GUID: NScUnnUQ3zTyZvCsEBjlvST7pzTmcTGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=683 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130107
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

On 13.12.2024 12:31 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
