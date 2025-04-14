Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B8A87CFB
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 12:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B271010E549;
	Mon, 14 Apr 2025 10:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVe9d1iw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0A610E560
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 10:07:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99kpO013590
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 10:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ly7+Lf4BHJrMjAm9Lfb1Z2p3t9Jk/PAnGffPfBrIx/Y=; b=HVe9d1iw++Z4b9v7
 BpiBexfZ0qtbbE9eg5sJFsmaVq+oumcPRIJ2q68IDqwfI6wo8ML5j9CutI/lNTO3
 PUzjWbW8nSkeCtH8FE/+BJAIBzmmYwjuOsg34kYDrkYoj9t6yM5p5/KNmbnX+H22
 uh79OBlFb1oNUooaQvKivG+y0kNZpCfqj6ZxNvwgsMckzqiWSYI0eRLmVs6TEe3B
 NBb7x9CS+2XyUkMt4BFr+2sQ89/sApqDaxE2PsOejHxqzNR+WOWo/lnCkzMlflV6
 2EQ/KfPXXfcyXTF3bU5QAMpJ4DSspisoK8AJPyjmw0XwFMPncd3Eyy7hVq6Og3G7
 XoOgqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcv1h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 10:07:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so766915785a.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 03:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744625252; x=1745230052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ly7+Lf4BHJrMjAm9Lfb1Z2p3t9Jk/PAnGffPfBrIx/Y=;
 b=ZoXmJs4/Fib4G32aVu8eqfIcD8S0J/vZjYsi6jYsiW+GsqZx6jmTPlvBsVNyzp/18Q
 l19PSKBB6th6yvt/eKy10FNZKP/allsgddpPxb+GbJtQdbb2guH33k5DJxRzdSIsdcNj
 Z4gpyl+9DJfi6BIVm1hrBDW80K7njX5O9Y4Tosw1IPaU2kDawN7QX3T4c/FykXxLFv4r
 eU//7jNxqgY+HyVWAsYf4/8cSmrwVCb0rBfeYP5vjR0yL7LTQ6KugQJzWQcmPWVnlJ7Q
 8/wXkBHEjmc966HYosY1rzYNwb1V5nZs6DmWD+DJjhAw/xxKWSbZ7BN7ALKDh9EUMDCe
 Ug8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9E9hP6GpdsXRJ4owGNaStnOC/zPXI+lp1vTk7KasaELWcfbFIdTzhhdBpKFDZ9eO4WV/Xofb6xhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwawHCUeMKyuDEck6q+9mCdIbEShorcNP+GMoXyXfaQCLoWedxo
 SXd1TYOu96weTObBHwZiE8tsSQs4N5/2SYy6RzK3T/QgfBUrga+GJZoYSPc831qdmBRpui+PBqM
 Y9RtklvFD/dQ7qeaFiEkUYXm4rpninL1t5+9+9rxCOtYXtrRMHWok27H8LuwtdNnGMGc=
X-Gm-Gg: ASbGncvpsEzXZZgibURQJX5lx/uzqauqOEMFTlMk3qlPD9PF/gDfKPYO0fyeXGmB3SB
 L/rGwG1KgPmbFwjtbPxtSdxd5p18wGDa8mHXqju2dRkQCVIlQjuQFI95LZfwBp1AMsztbmSKz0I
 YGPecEiOA7mIWt1zSuKmrQcnAmb9YkJfj9LHpFGxhkfaF3KyffFtBMXS6JYVjoICgHa/05n6RVN
 kNAG66L6F7ymJ2f0Fls6W1ZOa1qOAoV310ZdWmcPzbcaMHH72ouBqKY9eEXGY1frOewiwiZJRUs
 x/xuSdPD37Yb0zFSjEzYbhSnU9z6KjWFqP/TM203gUwQYwxmDv/wkFgclbc58PU46QPLJ9RjBtN
 +FqA8VTiPY7oQUOgbdHX6uPqfyTZ67y61VWldSb4dfB2dKCo6iaotzJfp9CbW
X-Received: by 2002:a05:620a:2983:b0:7c7:a736:b698 with SMTP id
 af79cd13be357-7c7af113829mr2043021885a.40.1744625252385; 
 Mon, 14 Apr 2025 03:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhW/DRW1SX+Ynk28CKsmigZX51jEHaeI2hluFbgc7JLNiukOLlnHIMVtoWmJiDxFw7PgmHqA==
X-Received: by 2002:a05:620a:2983:b0:7c7:a736:b698 with SMTP id
 af79cd13be357-7c7af113829mr2043015385a.40.1744625251811; 
 Mon, 14 Apr 2025 03:07:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c3:3f5:b80a:2e22:2f23:20a1?
 (2001-14bb-c3-3f5-b80a-2e22-2f23-20a1.rev.dnainternet.fi.
 [2001:14bb:c3:3f5:b80a:2e22:2f23:20a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cc0c3sm16322941fa.37.2025.04.14.03.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:07:30 -0700 (PDT)
Message-ID: <7b876428-6f54-4c40-a234-57443eb97ecb@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:07:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-8-quic_amakhija@quicinc.com>
 <nxnqwh2mzvnxv5ytwjsyulxr6ct6mhv3z3v6q4ojrjhhclwv2i@55nb56hnwi3y>
 <0f4eca6c-67df-4730-88b3-a277903deabc@quicinc.com>
 <wzqct2y67h6bkazxv3se77slsheaw5rspgcrcfjm7ngr5t4alw@nktpqrt5woky>
 <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <bb277124-a225-450b-acfe-0acd0f94b263@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fcde65 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=VaffO4KUCATw7Byn6EkA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I5cVoGNJa-SnLEi3AMMwFVAvi9xgeVAo
X-Proofpoint-ORIG-GUID: I5cVoGNJa-SnLEi3AMMwFVAvi9xgeVAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140073
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

On 14/04/2025 12:56, Ayushi Makhija wrote:
> Hi Dmitry,
> 
> On 4/11/2025 1:31 AM, Dmitry Baryshkov wrote:
>> On Thu, Apr 10, 2025 at 06:37:54PM +0530, Ayushi Makhija wrote:
>>> Hi Dmirity/Konard
>>>
>>> On 4/7/2025 1:42 AM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 04, 2025 at 05:25:36PM +0530, Ayushi Makhija wrote:
>>>>> Add anx7625 DSI to DP bridge device nodes.
>>>>>
>>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>>>>   1 file changed, 207 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> index 175f8b1e3b2d..8e784ccf4138 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>>>> @@ -28,6 +28,13 @@ chosen {
>>>>>   		stdout-path = "serial0:115200n8";
>>>>>   	};
>>>>>   
>>>>> +	vph_pwr: vph-pwr-regulator {
>>>>> +		compatible = "regulator-fixed";
>>>>> +		regulator-name = "vph_pwr";
>>>>> +		regulator-always-on;
>>>>> +		regulator-boot-on;
>>>>> +	};
>>>>> +
>>>>>   	vreg_conn_1p8: vreg_conn_1p8 {
>>>>>   		compatible = "regulator-fixed";
>>>>>   		regulator-name = "vreg_conn_1p8";
>>>>> @@ -128,6 +135,30 @@ dp1_connector_in: endpoint {
>>>>>   			};
>>>>>   		};
>>>>>   	};
>>>>> +
>>>>> +	dp-dsi0-connector {
>>>>> +		compatible = "dp-connector";
>>>>> +		label = "DSI0";
>>>>> +		type = "full-size";
>>>>> +
>>>>> +		port {
>>>>> +			dp_dsi0_connector_in: endpoint {
>>>>> +				remote-endpoint = <&dsi2dp_bridge0_out>;
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>> +
>>>>> +	dp-dsi1-connector {
>>>>> +		compatible = "dp-connector";
>>>>> +		label = "DSI1";
>>>>> +		type = "full-size";
>>>>> +
>>>>> +		port {
>>>>> +			dp_dsi1_connector_in: endpoint {
>>>>> +				remote-endpoint = <&dsi2dp_bridge1_out>;
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>>   };
>>>>>   
>>>>>   &apps_rsc {
>>>>> @@ -517,9 +548,135 @@ &i2c11 {
>>>>>   
>>>>>   &i2c18 {
>>>>>   	clock-frequency = <400000>;
>>>>> -	pinctrl-0 = <&qup_i2c18_default>;
>>>>> +	pinctrl-0 = <&qup_i2c18_default>,
>>>>> +		    <&io_expander_intr_active>,
>>>>> +		    <&io_expander_reset_active>;
>>>>
>>>> These pinctrl entries should go to the IO expander itself.
>>>>
>>>>>   	pinctrl-names = "default";
>>>>> +
>>>>>   	status = "okay";
>>>>> +
>>>>> +	io_expander: gpio@74 {
>>>>> +		compatible = "ti,tca9539";
>>>>> +		reg = <0x74>;
>>>>> +		interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>>>>> +		gpio-controller;
>>>>> +		#gpio-cells = <2>;
>>>>> +		interrupt-controller;
>>>>> +		#interrupt-cells = <2>;
>>>>> +
>>>>> +		gpio2-hog {
>>>>
>>>> This needs a huuge explanation in the commit message. Otherwise I'd say
>>>> these pins should likely be used by the corresponding anx bridges.
>>>
>>> Thanks, for the review.
>>>
>>> Previously, I was referring to the downstream DT and misunderstood the use of gpio-hog.
>>> After reading the schematic, I realized that gpio2, gpio3, gpio10, and gpio11 are all input pins
>>> to the IO expander TC9539. We have already configured gpio2 and gpio10 as interrupts in the
>>> ANX7625 bridges, so the gpio-hog is not required. It is working without the gpio-hog configuration.
>>
>> Please make sure that there are pinctrl entries for all pins.
>>
> 
> Thanks, for the review.
> 
> While declaring the pinctrl entries inside the io_expander node, I am getting below error while checking the DTBS check against DT-binding.
> 
> Error : /local/mnt/workspace/amakhija/linux_next_11042025/linux/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: gpio@74: 'dsi0-int-pin-state', 'dsi1-int-pin-state' do not match any of the regexes:
>          '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+' from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#

TCA9539 is a GPIO controller rather than a pinctrl device, so it doesn't 
use pinctrl functions. You don't need to describe properties of the pins 
that it provides. However, it can use some pins on its own (like 
reset-gpios). In such a case corresponding pin should have a pinctrl 
configuration under its pinctrl device.

> 
>          io_expander: gpio@74 {
>                  compatible = "ti,tca9539";
>                  reg = <0x74>;
>                  interrupts-extended = <&tlmm 98 IRQ_TYPE_EDGE_BOTH>;
>                  gpio-controller;
>                  #gpio-cells = <2>;
>                  interrupt-controller;
>                  #interrupt-cells = <2>;
> 
>                  pinctrl-0 = <&io_expander_intr_active>,
>                              <&io_expander_reset_active>;
>                  pinctrl-names = "default";
> 
>                  dsi0_int_pin: dsi0-int-pin-state {
>                          pins = "gpio2";
>                          input-enable;
>                          bias-disable;
>                  };
> 
>                  dsi1_int_pin: dsi1-int-pin-state {
>                          pins = "gpio10";
>                          input-enable;
>                          bias-disable;
>                  };
> 
>          };
> 
> I couldn't find any devicetree example of tca9539 which is using pinctrl. The gpio-pca95xx.yaml DT binding does not match with any regex of the patterns properties.
> 
> Thanks,
> Ayushi


-- 
With best wishes
Dmitry
