Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFEB0A8AD
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 18:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D0310EA13;
	Fri, 18 Jul 2025 16:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ylh5KbBs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2110EA13
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGgPkY028129
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QS06yXcjbSspxBecv3JOOSas1/fugGVTr9GX0MVCJoQ=; b=Ylh5KbBs/AhTwKD8
 TbrkOekYjnCBffFWkS1xyRuNgd3RfyLJQRqK4iObww63pTiV4qFZMZw4es7MltOv
 g7LWTunJ6cl9MVutvxCqXrg0tKcrVAe7dKyhKLo8bRwitwrVGRHgBdllSwm9Dk6+
 mx4rNbY/he3TeIme6GtenjG0hdJ9Nfm8H8+spvFVPS17LMz4HBfivSFsLyuH+oVj
 5rI6ZIYATcmEr9QKCMbatIjr/6RFPq03ut4ztcNVD5A/3/eZXoRUK0AOIqcJQ5HY
 u8xMCdpBvoxgi4jJt4jdcXt5ojaIF97VkUEiTITTvxS0Ce8hUoYaPq7XtnSEOUjI
 AdfVMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64hpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 16:43:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313ff01d2a6so1873430a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856996; x=1753461796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QS06yXcjbSspxBecv3JOOSas1/fugGVTr9GX0MVCJoQ=;
 b=etCQfVYOzX+a8T+1dlfPhWUnPX6x7geshMDHrclqGafvmmPN5ZsWYsz6pgw+gXZ+0H
 H1gmuRJnfZhdbDyoKU3+MRxPptYhOKBBdKxEODsSpIqognoooAw5mvajsq+jQrdOF01a
 1thSbNCUEt72Xs7AFbqT1OMLVzjdhKXU7yRtAe87ViQ6U6P/c7kiHQAQZ/EQ6WXS6+8L
 CxNDUhHfDTlPmIC+BQ2TPT6VvGJAXiYshO32qWyLQDj+Zp7RfSQ6vAXVdIK9hnybGm7C
 Dfqy8EuewrzH6W1Y05O5wpYRjluraEeifs8/pFd1ueUZ/uMeBol0Gy5+lmDtGxylXVa2
 qzuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1tEjEa7596HiXO5l1/4hSHItgCHpJoXH0g7j/YXAvTYKMzq2hiIRxMDcVkC3XJ98LHM6QbIto2Ow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHnhO5zlJbCx3tEZBdtok4lAsuM8CjmDPnxoIeaJwmTgZrAlhq
 fwr10N6GnVUH/ra2oFFIxMOA0Mk6MAcvsXvIqoSX7nsgD0MDbPWG1PLucpGJOfmS0P0bEXICk7X
 EGkiGOMSyPmjGUKJwabKieAT6GjGPSkLubRLSqd2/CJYsjYWuN8XeXiumqDoKJYXq1OezNFA=
X-Gm-Gg: ASbGncuq9QcO7h+TG/qizn3w68WWeyZ3wSQHGesKTXtt3BgbMeUCuWyIslVm8PmWYV1
 7ssTKjrpTG1iMlJmiqZg3jPECqzc8oq08aTVx2o3dy73iNjDy05zEFGvZ4dsnYEThzuvlMTsCyK
 U5eNBLEzogcejzkYszofm52RbNlaBTE5o41FkS6nATixdVvGVuJIbZwU+QOkktVj5eETzeA2/b+
 /y0Td/5nKb4/E/lA1Ch/4rtRsZgQMMgaspcNcYo/FOnA7njp8p3wiipTGmiOKgqImpkhp1SMGlY
 oZf1ymqxpMdcXhhEtH5agZF6W0+V6jpVoyDbrjDngaNwbB7NjuxAt+cjwZu1uaPuzbO0g1eQIQF
 He1eWdT+7UXA/8b86U5JhQQ==
X-Received: by 2002:a17:90b:1c04:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-31cc2515a29mr5615555a91.6.1752856996006; 
 Fri, 18 Jul 2025 09:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+SiK5x4mKGH5S3TmuPOs72xqUJSROCjvf33zej2kjfIp7ot9LWhtsKx+NbT7x7Y+uEruIVA==
X-Received: by 2002:a17:90b:1c04:b0:312:e9bd:5d37 with SMTP id
 98e67ed59e1d1-31cc2515a29mr5615498a91.6.1752856995510; 
 Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e61d2sm5340211a91.11.2025.07.18.09.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 09:43:15 -0700 (PDT)
Message-ID: <f59a6654-e04b-4caf-a570-16016fa4be81@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:43:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a79a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1IdYYe72uQdTEr82hC0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jP4CwQYLn6ssV1Fg2Ln927MBr4Pc_Z7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzMSBTYWx0ZWRfX3wahJbJuEODQ
 pHA4NBg9u12kxrJpD56/5UA8AwCm3ilC7Tnhv2C/PrbYHQvmEvJfZjQNPA/Kw33HZQMtiXRg5nf
 1PNQkPmjxuM6xyo6m0TdfLoJOO6AAnLTBhSRznV97fT5gVLcjdilFqcX9ZStvp5/6YVd5G/pVbb
 pkIOjGRQrHdNfEv1R27F9ne0k+Yow7SgkeoYEn2kJVoiXXvvLu9UGpsz6GwLmJfyRdfrpCDmwq6
 SGHQmawhlJrGiVL7UqwfoTMzxYhFE3cmmFQQ0gA+6A7mH5IhILbsqxLp2icN3BByjhSUOkJknTN
 J7fttSWHu/ETeA1f5dGSs4+JXI5XbSGQJO8QgXJBGF/rvCDlL10g6rVSiqHv4u+t4c+4t8mODI7
 lNXdTz597fShZUUzoE1Jb3QFwCMYagb5bCuuV76+nwTqTExiHHrIBU1rxqiqTdyoa5+rFExX
X-Proofpoint-ORIG-GUID: jP4CwQYLn6ssV1Fg2Ln927MBr4Pc_Z7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=994 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180131
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



On 7/18/2025 2:22 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:42PM -0700, Jessica Zhang wrote:
>> On some MSM chipsets, the display port controller is capable of supporting
>> up to 4 streams.
>>
>> To drive these additional streams, the pixel clocks for the corresponding
>> stream needs to be enabled.
>>
>> Fixup the documentation of some of the bindings to clarify exactly which
>> stream they correspond to, then add the new bindings and device tree
>> changes.
>>
>> ---
>> Changes in v3:
>> - Fixed dtschema errors (Rob Herring)
>> - Documented all pixel stream clocks (Dmitry)
>> - Ordered compatibility list alphabetically (Dmitry)
>> - Dropped assigned-clocks too (Dmitry)
>> - Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com
>>
>> Changes in v2:
>> - Rebased on top of next-20250523
>> - Dropped merged maintainer patch
>> - Added a patch to make the corresponding dts change to add pixel 1
>>    stream
>> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
>> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
>> - Updated dp-controller.yaml to include all chipsets that support stream
>>    1 pixel clock (Krzysztof)
>> - Added missing minItems and if statement (Krzysztof)
>> - Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
>>
>> ---
>> Abhinav Kumar (4):
>>        dt-bindings: Fixup x1e80100 to add DP MST support
>>        dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>>        dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>>        dt-bindings: display/msm: add stream pixel clock bindings for MST
>>
>> Jessica Zhang (1):
>>        arm64: dts: qcom: Add MST pixel streams for displayport
>>
>>   .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
>>   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
>>   .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>>   .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
>>   .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
>>   .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
>>   .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
>>   .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
>>   arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
>>   include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>>   21 files changed, 235 insertions(+), 133 deletions(-)
>> ---
>> base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
> 
> Can't resolve this commit either in Linus's or in linux-next.

Ack, I'll rebase on top of the latest linux-next.

Thanks,

Jessica Zhang

> 
>> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 

