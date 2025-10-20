Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EDABEFC17
	for <lists+freedreno@lfdr.de>; Mon, 20 Oct 2025 09:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0378610E26E;
	Mon, 20 Oct 2025 07:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1ZNNLQ6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD26110E26E
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 07:57:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JGcZ8x011901
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 07:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1ic5bNXxreVSIVO1Go5QvhyrCQOLU1BzWAxz5v8DrSQ=; b=K1ZNNLQ6LVjaczUZ
 hs26L1lDBuSAPCx4tS9XllytcsdrALVP+Rhehfantj4NkrUOBxN7D5LFY4xAD4vB
 fzXJBiKbhBt9fgpx4HcTgBhC4mVZCEhzjJ4ClCmO32M4RoBkfJjIQcuPQIEzn+/M
 z31PlbMDLbhe3qeRnxFYhMrz6Rtp3C3AxBMGPqGLb5xY45g6ZzVsbN0bHYMj1Ggd
 eAiY7tye26dhNSGIBS52flSj0YJBnabov0R5Mfq130uw8rM6gqh/SblhAzS5VyFz
 AGBp7q8va2IeLp1+hO69MQtMQU271el/UIye/ZKdvPhRYp5kfzp0oGEocYfHgIXq
 U4Y0tw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w1nm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 07:57:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8906754b823so140339085a.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 00:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760947038; x=1761551838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ic5bNXxreVSIVO1Go5QvhyrCQOLU1BzWAxz5v8DrSQ=;
 b=xFXM2ATfuwKwltfQ3p7en2opNUg+6KHh1XfQ7bwPq4Ms/UKiud3X1yjoJXQzA7rB+j
 gpgJhgXxibrsTmLe+uQfjJ/pTsgyOBGLyJKJTvpNK4XW2Fbk5foWgeqakF11bIe6WOYl
 ORfH/PZEAXPkWc3YkkF0Oa8sEqY6jRzoWRKwByqOjg5L11BArPBZEuzxpKJoGA3lMnnZ
 DSA3wliR/7BOaGF+bVWO/uKT085Zm6H1M77hPtNPDfX83ngVM7Na/IO98ieYiDWwD6Lw
 Usx5AVj5w6TOnlicY/F6yGpaXv6NYEdrQo8AV68qeYoVHHjKzK7gVJTFkiocZbIf0KOG
 reDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJdTr5ENat76Xx+VJIsxpHJACtRtJGdQoirN4LSFbtNY1Chf1phM4zrb+BNSa9z9D8i5JfCB3lygg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9FlPTEbb0bWpNI5pnjU1ou0taY/9eKJRyhCkmn5JQmpJp9NBn
 3+CZFsSb5A8reqvEISfhJQK5ouhlwaUSGWQf4Lzwt6VSEiwEQ5J7zV8xqgkr8XmoZG73vwU9K8k
 ihoMaQCgQlevPnJgvySstwXc7IsJa1d9K1YeHniZBd65exD8RslHMfhPAtUN/obfYdMRc0/Y=
X-Gm-Gg: ASbGncsglwsEU97zU9fW5h6PKOlesPp1SNWtwrHZZpo77IXGLwBEJbRdI5v0L6Ec4en
 MUxiuGxQQnpmXlIepRZ0+QR5lLTmTysaRDXUZLO0/b4KC02tuF+atWE4VAjQLQKMyOJ3R3dpptc
 Spv25LV+GPdvmcI32PuAJy0worlJl3nvGnby2CrSPAbt/q4dhZ+m64JX+owWU0ZF5hyYZyTQQed
 R8nH2x8KDyYIOamH27BNCmhr7fTfi5pWDwMW74afXbb43ZSyOUnJptKebhsNzw96oH1j9bTgq7r
 PriaejYeqX21NpUZa1Ps+UfiZinEEQrCW6l50eap73XyO8b8cNxeWpxxQTNQgTDhV6IJ6ycu58f
 VPB73eP7qUXV9Lwq/zKfykJFI2PmhBj+wIofnYHirexLIIMb54xuyhIAs
X-Received: by 2002:ac8:7f45:0:b0:4e8:9af1:366c with SMTP id
 d75a77b69052e-4e89d362902mr105943541cf.9.1760947037893; 
 Mon, 20 Oct 2025 00:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBnWJcnNlKu9/v8lp9BtHCdJ5pN1JcnYbdJjV94hLdxAt6+Sr2jW+D0brGc3dRHU+JONj8xg==
X-Received: by 2002:ac8:7f45:0:b0:4e8:9af1:366c with SMTP id
 d75a77b69052e-4e89d362902mr105943331cf.9.1760947037470; 
 Mon, 20 Oct 2025 00:57:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949998csm5964950a12.38.2025.10.20.00.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 00:57:16 -0700 (PDT)
Message-ID: <e3547ed7-9fc6-4521-a9c8-6318dcd76324@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 09:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zQ8VfHjIcUJXFAtaJ5cfoMuRcM1Zx33V
X-Proofpoint-GUID: zQ8VfHjIcUJXFAtaJ5cfoMuRcM1Zx33V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX2E+3x+yDIPHF
 5nzbaHDcMu9GuGyeS98RXibDGbDQKw7UGc5vSNwovQP7syQxBmdPBURjU+3OPaIL2N9Grvm21Dd
 JAGQKW741OX5R0kis0twVNVz17VdimIZwp7SXheUzy/Qk1oXt5veGnQwx2EFgtwNY+EwIqHXX7w
 GRSiyL5eiKCcb4tRCgpBJ+viIRrY9R1Gj5aRzvGAjo08povqNj5Y3t0xXv6S0nheNw/oe36PawM
 tw7lPJH5jYaU6cJInlEA2X11gruuH16A5j4xPnYe13gFGTZvA7juPfvWSJqKpZQuP3r3urJGzOr
 YeBhM99utg6ky3QK73hFp7k+n2Jz1/4cm4hSOiuJBpxp4v9KWu79IO0QEDnlR4JEa6lHvWruf2d
 Un2M9XocmASjD2Ul6r7zYA8N/AbW2g==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f5eb5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iJWliPolnP7GhHh1kxwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
