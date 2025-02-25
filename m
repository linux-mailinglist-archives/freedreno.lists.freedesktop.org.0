Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE3A4402A
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 14:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C0C89EBB;
	Tue, 25 Feb 2025 13:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H65x+jn1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731589EBB
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:09:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8LPEI014155
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JXrbx//ujq81B4fzdK64SVgLYo/iHJ8aMUM9T0W/s8w=; b=H65x+jn1hBliDPdj
 VMZE5Dh0TVa72wVR+siWa9hQLAeXnZxWpdn51hKjD4fkkGTqWP3V1hjR/ES07liH
 apMwOKugawG1GL59ioQSavLP2OhL+touePl7kqF+kjAERTYEO9qHEiIbnQhYpHqv
 FSnZfTWXuEL0gToLFevA+MYm6iRgsNmuw0gpY0Z9Ohpb3T09CiNa9wPD63q4D3Y3
 1G1q10FzYJDfHNuUYiudBUH+mtrZaWqNBcLlingxk1A9hoq/b0PCENHKJjdf6XDx
 rArHYMT/GCg6bcfeB6OzxTgb98HKxQvOG2CRaZqyBeAOQUvUgFSCIKucLh1Dedek
 R/ur4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgs0jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 13:09:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c09a206998so126049685a.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 05:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740488979; x=1741093779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXrbx//ujq81B4fzdK64SVgLYo/iHJ8aMUM9T0W/s8w=;
 b=mXJc9Id+2mErnrRSTeCMm/nv3cKXR0joG6zDmvoi7BL+pBW+eEzxleN7VopxTpqh3j
 Sle3ilCBkcof5q61S4PX9QfLLjvkMUPevyfvK+UBp5FYc1gPmG3kRSP6To3cP4kRxgRW
 VrNv8riC8ALxhIcI5lCE2Hal24aazeBCOl/f4KvelT67MaAF2K0MFV+yXq58ohhl2EGT
 fKASs9Xof3xFhwF6D7yt+VjFlEkM4PHbbxSEWjg63lrKpPdaS0BTiyx+rcQejRwdTLBz
 7ea6mUADEpMu6OOa+MFCWVp4NAISGvXvaLr7dyQ3EX3TKdEqgNNq60cq0rTnsergNwYl
 EFoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSWy1Ko2NEm5MkHVj316MnZuhmNZ+FK5HR0T+3UhnLuO9qnBnhIUGldltwwOeg/DgMzhnt9BReFCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVcU6B9DYgQtFN2exV/10KYVaYs9Ozy4t1fIH2lfQbzlP/pj9G
 8ARADmhIB8Uy1LaLcKH/3nCYhJK42BHtwFhgJiTmHs0ImsshW8rmT9v9EAm5qA1eXuAUueeoeF1
 3rFSDPndg0MVEQ2iQzdpPzFYVg2TjpuAhQYEdwOXd26P+OjCX7G8XJbaT+NGBJ+vzAaE=
X-Gm-Gg: ASbGncs2Vacxr8tZAxLoKOYV598Mw16xksnoqIinVdykar7kb8z1XR2gT5VJn8ESClH
 om3d/1r/Y3oh/CjgjvFuRGrd0YDFsAGkBd2R99zAbnF6XLMOvooOf77y9waYe6Od8FogODXivw2
 SkCfoi8LM+7clHmYnxfDH9KMmtsU3uG1CAi68iUD7yef4h2f8g4VYcOW/rvicdd99iZD/pIP+4x
 +T2UUhJZ7boI3PRoDYkrTKKxIHVpVgzoxHBbzfRs5RJp9g2qmpKvDVJjFZ8aFwWyHqY7USM1L8N
 Q5YqGCjDyhf8lQXfVVgoUw3liwnR5MpsFhD7ao7XFIoH+/m9Q+XngUhIQ921LH8i3yobvA==
X-Received: by 2002:a05:620a:22ec:b0:7c0:a1ca:93af with SMTP id
 af79cd13be357-7c0cef00e4bmr741971085a.6.1740488978936; 
 Tue, 25 Feb 2025 05:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa0uJOUkscoJFqZcu/UhVHgYJ8ocIz6ucSftAjdSN31RKxhGpmSriOBUPSXTaf+LkELJ1nhg==
X-Received: by 2002:a05:620a:22ec:b0:7c0:a1ca:93af with SMTP id
 af79cd13be357-7c0cef00e4bmr741968385a.6.1740488978416; 
 Tue, 25 Feb 2025 05:09:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e461f3e84bsm1208986a12.76.2025.02.25.05.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:09:37 -0800 (PST)
Message-ID: <7785000b-db32-483f-ba2d-8536e00e10fc@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-7-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-7-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Osh4DjPh67nsKiiimM-WlMQTdBTau49D
X-Proofpoint-ORIG-GUID: Osh4DjPh67nsKiiimM-WlMQTdBTau49D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250091
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

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi0_phy 0>,
> +							 <&mdss0_dsi0_phy 1>;

Please rebase on this patchset:

https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/

Konrad
