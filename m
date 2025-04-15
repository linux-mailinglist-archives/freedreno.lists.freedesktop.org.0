Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BDA89894
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 11:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E7610E0D8;
	Tue, 15 Apr 2025 09:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR2rNzqq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B079010E0D8
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:49:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGfG005855
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KOIM5yPpo9MViTBKkLNoXdzuS8SDS+QNfkUos1BVNLM=; b=HR2rNzqqCQRNtosu
 jEyA4Dwg+NNBmGGuCP+gFkw6Sr3hJ7PnCrYM15v3TrbbxWlWj2G+WYbGAcbRFd42
 kapFPavs0vYmmIcTTg69pEtU9PzAapxIIsqm6A2GTa5Qt8IQCqN69eMogWNqoRby
 Rqa8IGGo0sz52m3mMvnBsonowiawCWbZynuGm68L/Ku0+HaiLdcwvMXdVlyXNJxq
 P/Jnh2niB/eBa1v4GseskiAOZsVQDwVDnssPhA3Se7nCxGTOHVYJS+1EYoMTNKWl
 M1h7HIMsbL+w54teqwkwUXKGRIWwUkNxzCCcGhNojgUsAPKqumjKdjNrvLo+E1du
 44q52g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7rkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:49:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54767e507so882466685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 02:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744710584; x=1745315384;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KOIM5yPpo9MViTBKkLNoXdzuS8SDS+QNfkUos1BVNLM=;
 b=junqgUuG/5eA5rNNwoA83w00JFfRpqewq0yZFMCtHD1vsUn5sw7Gsn8+TkqI4S37Ls
 J4aY4aqelBOXRwPqAFCfMtkWH1oTqUf6ICgJLUWSO6nuNaWbfjEMT0xodXuulGwgrs3h
 vJd7VoLgvuphN/MlsLroehveR4xticsenGmdXanZ3LBO+KI9cC21UAt1HI0XmwkEZnFu
 o1j2bXbNYtLSJKtzoTxMZSRmu465vn0N1vt02PxV+VlA8q9YhrQR3jORKfB75uRZg8K1
 +gJdrPeZT8iKLTfdL7xk/A77ootcJMPiuebTO9kzRRNnbGb3k9qwZQY+6ajM1oeJY24D
 PBTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnIR0rBmpOg6MmxXsTIu89oD7RIn/L2/G4IgdbD06Fmqbj3KIL09v+aZYBJI5Ztr3ufuC/flfXoIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlSWQUE3AEiMvxJuJxwKbWJTaTHJ62OxYZQa3XwBMCYhLLXpcq
 RilFp7wpYj3UX70m/630SXNwQQYKW7vPR31gq61l1Lj4yhUSdtCng7ay+WnqbWkJGeDdE5s0lWj
 qFkzkmqHUyc9pLvSuTC3/40Hns+j6Ch8D2TJ/Y5phzMYgmkb99ay7AeyUXRziqk8BInU=
X-Gm-Gg: ASbGnctt6UM1vb0xuNDx/bbtyfhLHJeVcFgVE1Kx64+P7KBO1QobcLM7ey2Rd0tmMi7
 ulFR5IN4YnsZx7LARjveiNATtzogBXLR40B7pYX+c0HZgQs9gMCAgg32UGLy8dE/t4uV2dQ3XNK
 1IRnUzzVfPlXgDl6l0V2Npu4uFuog3rfQc/jABU7xm4Ri/SCzQ+KM1hXx1+2iRB58shh2oeYOWl
 W2Xj1eJLA8HUi/MGWmHa7qnj8kMZropLdn/X0hM5i86TWeorOjA8pXSYR+AxaVfN2VkUvNmncT9
 xcfskeaquyf9WzPyuEcmI9QGUQFNxxlEDDapZZWkf/67f+VyVew0I2xvjkKXm7BquIq0Wu6HH3O
 ApzYvbtAX1b4WjSSgVYnKw9pymf7UOTBNNa7DlYV0DCagu/7/bgLERBLaC4jD
X-Received: by 2002:a05:620a:424c:b0:7c5:5909:18d8 with SMTP id
 af79cd13be357-7c7af0d3d1emr1773054385a.14.1744710583706; 
 Tue, 15 Apr 2025 02:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoHRiOt8l67E2P0R7QBa24QR77cwJMkGHiQzo6vMvNgAnJNTeO3hOBWB7ssd17odFt1mGM6Q==
X-Received: by 2002:a05:620a:424c:b0:7c5:5909:18d8 with SMTP id
 af79cd13be357-7c7af0d3d1emr1773051985a.14.1744710583367; 
 Tue, 15 Apr 2025 02:49:43 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f46623c2bsm20611601fa.111.2025.04.15.02.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:49:42 -0700 (PDT)
Message-ID: <10e8c3dc-fbeb-42e1-b810-d80e768ecf6b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
 <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe2bb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=01dcSNK4EstfxtfeDswA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LJuJwKZRpROsHbzG5uqOV0bryq8CZaLB
X-Proofpoint-ORIG-GUID: LJuJwKZRpROsHbzG5uqOV0bryq8CZaLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150068
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

On 15/04/2025 12:44, Konrad Dybcio wrote:
> On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
>> From: Dmitry Baryshkov <lumag@kernel.org>
>>
>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>> controller. Link DP to the QMP Combo PHY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "mdp0-mem", "cpu-cfg";
> 
> The first path should be always on, so that if CPUSS collapses,
> the display may stay on

Ack, I'll fix that and send the next iteration tonight.

> 
> other than that
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


-- 
With best wishes
Dmitry
