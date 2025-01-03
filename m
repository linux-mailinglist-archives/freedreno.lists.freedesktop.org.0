Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F1A00968
	for <lists+freedreno@lfdr.de>; Fri,  3 Jan 2025 13:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B45D10E89F;
	Fri,  3 Jan 2025 12:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnRMaVB8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9027B10E3CD
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jan 2025 12:42:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50376OGW032123
 for <freedreno@lists.freedesktop.org>; Fri, 3 Jan 2025 12:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TZARMRNqfJJBSi0ZuqSgSannpryoCZUFZtAwwKozzXI=; b=nnRMaVB8anTGzIqz
 Z/SV7YYBtvPCSwx+azpasLMav06W23ogMLE8zV0C4njs/pYmJ48Ker3/HAmLb/JG
 q5u5uOfXelWitjaizImhNyKYHrSGBkP2yf/5M/B4VCAGsv80cJTZXeqdyULd2wZK
 vzfR4OHtp6JkfgRU03rsKxHwZQEINku3b/ZTo2PFxOg2a3SbrZlIdT/3g+k8s81u
 owpnsWZDssYTJkB0Jm8oRLvxa7pofQHY9p4DcdWNhEud219evO6s67WppPX5D8kC
 X5+uox+vguhsiTdYQeT/f8MCMnIQSR3rTfMYLua1ovIaWQeLf0veDi5OXhieXpQv
 YGrRqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xb700psr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 12:42:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-46a32c5cdbdso8046871cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 04:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735908160; x=1736512960;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZARMRNqfJJBSi0ZuqSgSannpryoCZUFZtAwwKozzXI=;
 b=NPraQtR/A4KFmkecR+OkqXvpeoYFIkg7klcYUnv6PgSZMye8GsrhYYTPdAPjZ00E1Y
 wCcAYGC4QKAP3klxNpkmV+029Y43NBlyxdgxTl+eoGg8cROKFgXSIlSgtpgBa1TjIjxN
 o/v6kt1kuMuwwCF70Wr5c50ZTquATGpVK2eZ+Bpex8ribI2GDPlUFoS3xTQ7TzVeQZIP
 YRgX6vf6Cds6GpL8EXjsvPq5fUvd31O7LMkflquWsX+sby/xAja6Duuz6oDqQAUtGYLr
 2Oga+FCgRVBiCq5Tgpt/Q6vNcsuxyjs89AAHGJ78BzQQMXttPLxjG0VVtaUYtAft4rAS
 Qr4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBt1flsaJ0i9qhkFtpzI0Wx4ERHT7WArVdtfFCAkBdwWOCIGP4RFfyR2P7rZUj0l4gOjsrkurgqoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPoQsrP0Y6GRGuBF5OPN4FYGj95/o0z/nwuN4/eE6Ysz8aTRTG
 URtguB6kxSE4JsVOJ/AgQkXWoW1uikB6rbzDOFsR8XXi/tv5RwuKMuQfsdedNp8VN3qkK2ojEUM
 MBd5/02Fr7dFIS4KgAo1LKIEXPrsJhfxw/8NUHOjE/R0BfhQ6iX0s2QpoLBVxEw8beP4=
X-Gm-Gg: ASbGncsSnnGie9gP6ywMwmg+KE3kQoyaO+tm7397ffHqnhXBybLpkwg/DUXxBlBHYOA
 njGYVLOB4pmKvBdh5s9nyE0bDhz0mBN3QrNPCLhr80/eir3BeKj7a8xais7/mRn+MCKFIaOzHXm
 8Drxzr0op2KzACdUWARuYq7hCZZXdIEo9RLJc1LgHZFT/wn3jLe+tceIMOdUv0shnN2z4zgF61t
 1/M8H6O+4uLArncrvRQPhpwPfG5keyqfsCNQTz6/TYgigD5smxxDkHyaStGDBE1JYm3TapfImRm
 LQxEJMYlEk35QhCUrR89/QwLRKBxfTBRFYg=
X-Received: by 2002:a05:622a:1183:b0:460:900d:6052 with SMTP id
 d75a77b69052e-46a4a9a34c7mr310086231cf.14.1735908159817; 
 Fri, 03 Jan 2025 04:42:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcALt0LJyqknH0pa/OzeBKOkJJU1g2a9f/TCjCM+WwWX2eXlLse+id4suQvcMJE43uhj1+Eg==
X-Received: by 2002:a05:622a:1183:b0:460:900d:6052 with SMTP id
 d75a77b69052e-46a4a9a34c7mr310085941cf.14.1735908159459; 
 Fri, 03 Jan 2025 04:42:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fedaf9sm20087153a12.56.2025.01.03.04.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 04:42:38 -0800 (PST)
Message-ID: <78979ab6-0ce6-47c4-abe2-d4d2d9d50480@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: x1e80100: Add OPPs up to Turbo
 L3 for GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-6-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-6-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XhcZc1ndAReYV6DxsaughbN2M-2m71aA
X-Proofpoint-GUID: XhcZc1ndAReYV6DxsaughbN2M-2m71aA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=767 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030112
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

On 30.12.2024 10:11 PM, Akhil P Oommen wrote:
> Now that we have ACD support for GPU, add additional OPPs up to
> Turbo L3 which are supported across all existing SKUs.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
