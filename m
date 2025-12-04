Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A3CA2FFB
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 10:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD8610E8F2;
	Thu,  4 Dec 2025 09:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5QddFXj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kz0dX23g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721E010E8F2
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 09:30:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468bq4551358
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 09:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=; b=O5QddFXj5oDC78Eu
 AFD5D0c9iubG3vkR+/J2i1qxT3ElqH9myB2/Ni0eABOe4motCjDWJRqaRrzfrqmr
 rCqrsAW06wJ9Mdd+pN2kXo7dsrXcc/iAoOh5eOstWxEDjsbqDQRis+H+2rtbsdS8
 qioiEqo/yx7vrRucFB/2ccooRVd88Zf5F1qFJuS22jQvHC0nTkO4lKUPCX4VNQ6J
 dPnk2aMfigsN0+4dnNjpU3ExnmO/CEWqcr+BYlS7QncP05Jahf2jwcddRKDC5D60
 wSbIVCZZ2r3DQV9HrzD647Zkw6/IXXfQn/sPuTfJvyeLe85KIKzLCwwcXHdPVXl/
 O8mSoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdbgs4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 09:30:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88046bc20faso1939356d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 01:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764840650; x=1765445450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=;
 b=Kz0dX23gkrHt7v8TNtMCkeVAd3vbuOxd/49bnV0b0JRx+AlkY7h57aZpyH9Ilsqm7Y
 kyS446fiGlsMvR4l7/5BiKt3i4d92oiLwKA/7IZipdltke168TU2vrNNq69DObYsHTaj
 lrYYCFjHxISGwSyFsnD3ABtxGZi4FFMa+hintDRxcqLbtV+hpqHC1aE6HBls+W3yFtin
 B+giVM550arGpgxrfL7wBbGqG4+SbC33wtbkS8uV6liZaLnm6lcMR1oOd378xSWWWw4V
 EVhGb3GL+LGqb2uW1Jdbo9Z8MaIgqQPVM9NOTFX0si/lF5k9SxcngIBX2H3Xyg/1vloc
 vaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840650; x=1765445450;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YHZIS/ifGG1Oi6aVWQjKLm6950VSJb+EI1VzQSHfDCA=;
 b=hK1lc8KnSMP5cv6CfQet3WgPe0s6d8eBiizKlfz5RGxmxZINxX3TwwUivtPUr/Uf8R
 Y/lsIO6ef/PQiw6bJEMtux3XXnqZmLePl2DbVMFwg4o/JBYvor1SonSWQPR/yRN7hVqJ
 VRuQKoQDc4uGjU8I5v0LnnUX58B8CEbNQUtKdiaruKanDgWbbQwN0o5u1OztY7Ag1adD
 fwuMIPpA2Y8Wl5FE9seW+Pulb3rKKfWQHUVeggvvXhD/5BixkqXHCERlsLMC9iHLfZ2H
 PZ6c2YkDpWKILdD6JKUS38nF+sMBXkDw6kJjhnJ6KyKphOAkHSPZynLQOwVnOG+3U/aD
 YPJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkXm9NMi0NkroVU+MJ5rl4DTcPRfjMYE9wk+e+r+ZiX+WnKYrJH4saTUSZ6VbqGSZM6cpFUEs77xE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRJueOBs3GRcE+NScbw3a4Si543y7wkaYrL8VOPLU0euEej2Jc
 35cKxORG0H/1mYwZbLWqnNO5JB/D2gKq2xY9ikhog6Hx9C0+rTPo5IZaMPhfAo8piLn2s9mFlQs
 G5FunRDbrwmKedkkaXzfy6d6Dv1XxfpWGWI9P4UZswouw9GwsD8dVbxFFnComoAGUYZzew1s=
X-Gm-Gg: ASbGncv2zhQRdoJB8Rqt7Wx+R8EcCWZrL0HiqNQ3EjJbQVqLkEDfrPZ8xLKWo20SGFK
 +DfuwlvWcPR3ltNXvgMGkiSY7tX4t8lF9B987QCd7myx7qqVTdKWHQpTia8ysexp2GLP92Wp9aG
 WjdMbaz4Sr4b++YM395qo86enWQZfazEMhw+mxX20i18Kw5H6YbB2olh7YdS4/uB5Y98DGOZn0z
 zbb0CDwf8tIaBPwZ7tO9ODcRIAJ3D1qBt3i+LqDbR1F0kPXLQZBDW3d2JtTW1TkfR1H14W8nu0Y
 B7IxlSoO8ZX/uiw4Q7QEnVJX+B1EJT6jsza2xTjmKlp4w1Mns0MhSamyPb6vtxJd8PQz4+HJHjn
 UlAs50KBpojvJymUdty/e+apIyQifpAoZxIIY3YhD12EMmh7uRcAjnegfm4YLpg6HPA==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id
 af79cd13be357-8b5f8bffce1mr486936185a.1.1764840650293; 
 Thu, 04 Dec 2025 01:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNiLdjRNKO9ZcI4TFhvnmYWWXLXzFWvAeb2BmQ6tBMrffZy9O/0DUsPB+d6zCalUQC5juiFg==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id
 af79cd13be357-8b5f8bffce1mr486932885a.1.1764840649717; 
 Thu, 04 Dec 2025 01:30:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c88sm78208466b.35.2025.12.04.01.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:30:49 -0800 (PST)
Message-ID: <46d2aa15-6866-4777-a080-f983ba3769d3@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125013302.3835909-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cjs08bqhxkUZNx3AWgYIYz4fxqqlJbUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3NyBTYWx0ZWRfX8NqyQy1tJqw2
 WjLAGEYt7g42rOz/tg2pGJFb2gRcO1zb4JZozkADSL/0Vei7ZZG/GyDNTgdO9eg5ornw8m5765y
 4U178ss+dv0mljsO5S24VgdY2i+NDCinmhjUYXPiJ5auhOgG/M7DAmNQFfdsN6hw0N2dLhKMxjW
 XP3t2gz8BnIplbVMQMi2jL2fD93JnId7oMZwDoyvS9/sd1j30T94pZ33wxO7dxGaKfBYTQJLWcW
 V2tR/h6Y8Gp0lruj7MYt7E2AjBOI8XAyV/K8LCA3nM0gqvuieKIMM8GtFDVp3l9hjjrb3tvxzyC
 IIIoTUH4AkgrvwKLzilKbFqq9OQO4IlA7MOCtsFAH//GIO+N+tRSL1iSc5XKhUXGZBAH/VQTGVu
 Wx7+RI9zdBR2Qn5B+utlAhHu4anqig==
X-Proofpoint-ORIG-GUID: Cjs08bqhxkUZNx3AWgYIYz4fxqqlJbUB
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=693154ca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OIU6w6j0321fZR4p8lUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040077
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

On 11/25/25 2:33 AM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {

\n please

[...]
					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {

here and the other one too

> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};

[...]

> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";

1 a line, please

lgtm otherwise

Konrad
