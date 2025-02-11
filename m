Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27868A30C74
	for <lists+freedreno@lfdr.de>; Tue, 11 Feb 2025 14:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F4910E6B6;
	Tue, 11 Feb 2025 13:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oi5FWt4R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AEB10E6B6
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 13:07:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8qsEM001434
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 13:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bsqyhUimndYfhqr19Fi/0ypW4Gx9BRnINfl1VKPK4yk=; b=oi5FWt4Rjsn56DnX
 p7COLY6W2VIycp1i6bqXzsdKObkrzE3Lj6qRF66LeyRBj/QvSs+ZrXUuuuVqULmR
 sdHKFQzch/SkzsOCx+YwhgdF+Qn8f4qK39aBToV3qmTbdNZkqNlKhCWVbJPEvZoA
 kBANVCNwWaF2lL6ri3VnNBf1v/GcMqbTy+DKuIfUrZNqgKzlzy769VfYahCbe52B
 aimCTA7eKQxSO86PyuFJOpi+zc7jC0J3Fx/GRLvN2wMeSYmnib5i3kKI+bKRj7G9
 EK76X0dfgW87SCAzE6Gub3Xx0ZEslhz0zGydgsnY50LweGi3WV1efqeGPF08qqSK
 bBxKvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxm3sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 13:07:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4717d747eb8so3897501cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 05:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739279262; x=1739884062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsqyhUimndYfhqr19Fi/0ypW4Gx9BRnINfl1VKPK4yk=;
 b=KXq1G3s9aQuhIRnfaYOepRZWxpJcS4ZSZD/WLsVp7uPoY+Abp623OBZcLZjQCy+vin
 v10vxsODSKMMwI7LrorTRgcTu71QLvZhGaOsqmJDR0EVxf++/G9L5GGQD3O0G17XNsrK
 flAVHNsKUbZT6mqWOr09P8DOJdkXTIHivWOS4UiKV9yEQs3/YArsuXdR1TIypvghw/s+
 /m9QXsrOzibLKFtis+r7RFCPoGA8AbSB8ig69IkCrdVBNm6n1jjiqoP6JVm2yZWoFpzK
 nF5uO88+iAwA2OoIVzknORDuVN5SXEpUFUiPLQvGVO/BGZIbf2pyhTH985p/TOQNdhEj
 elPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHeq+6SO8yrop7PJyARN7V5rIOyKFedA6UgF2v7bimUi9z/IHEJQueX4kT69/Bf2QwAaXwSiy6G6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9MWUJlwMI9rl1oY/lmxsoNLj3pLmxg2ps5qqv2J7CZHmy39c6
 eOhb0O/ffqWXSOZaYdQipTL3vy4idwUWZA17szyZdcH+hP17tUe8wzA6tY7Om6FlnWjJhZ22oyB
 8SOdnFBMnWlgEFnkyZVIJRcISfSrRORKI+RKWhvFv3wVHcwfsjWjAtfaOV92O+1aEtbQ=
X-Gm-Gg: ASbGncv6CWYrXtNWy4B1Z1YwPQetRtQDIR7noTW+mYt0J1qjinWpjlem6rQAXsBa6Qv
 m/F0PslfWMLa3ADhZ2OvixgUfK/E+Vz4r1ExBivoN8S6Hww9FUvVqTEe3hV2s4PhvqprNjqelEB
 o0F8w09SFZIeV+fXLHGSgf09my62BfCep2UmElSgxwZb8gpVDPo6e4uKjPhLOmwRZdC6pswGPsi
 Kht5r0ms/qO5a+PqWfJa+QfQ4eACAUMANExoW9RJVT7cLAKXMTxsZy7PDks+FpG6R0bTQVav0T7
 2qaFWwgDxD12yCzMnvK5UB5wm42b+snz1U4Ek1afphw2et4H/toQ1/GDN/k=
X-Received: by 2002:ac8:7e95:0:b0:46e:12fc:6c83 with SMTP id
 d75a77b69052e-471a38cd930mr11392191cf.0.1739279261994; 
 Tue, 11 Feb 2025 05:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf17TQcGeLggmbsVGrZz0dN+r0rFljR1fT9i8V4oZgVqeg6eTmzd49LgDFHMPdGNR01MCE3A==
X-Received: by 2002:ac8:7e95:0:b0:46e:12fc:6c83 with SMTP id
 d75a77b69052e-471a38cd930mr11392051cf.0.1739279261615; 
 Tue, 11 Feb 2025 05:07:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de58404347sm7153814a12.9.2025.02.11.05.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 05:07:41 -0800 (PST)
Message-ID: <dad5bf75-d8ae-478e-8215-7d89db793dd7@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: neil.armstrong@linaro.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
 <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6gZaPbmnBmlEtAkle9M-smnqtWVyhBzt
X-Proofpoint-ORIG-GUID: 6gZaPbmnBmlEtAkle9M-smnqtWVyhBzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110086
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

On 11.02.2025 10:07 AM, Neil Armstrong wrote:
> On 10/02/2025 17:32, Konrad Dybcio wrote:
>> On 10.02.2025 10:32 AM, Neil Armstrong wrote:
>>> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
>>> add the missing cpu-cfg path to fix the dtbs check error.
>>>
>>> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>>>                 power-domains = <&dispcc MDSS_GDSC>;
>>>   -            interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
>>> -            interconnect-names = "mdp0-mem";
>>> +            interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
>>
>> QCOM_ICC_TAG_ALWAYS
>>
>>> +                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>
>> QCOM_ICC_TAG_ACTIVE_ONLY
>>
>> w that
> 
> So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/
> 
> I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

The fixes tag is there for human eyes, autoselection for backports has
always been iffy with DT

Konrad
