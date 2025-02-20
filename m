Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56244A3DE13
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 16:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B5410E987;
	Thu, 20 Feb 2025 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9vjG56F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1D010E1C3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 15:17:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6Mo7q011711
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 15:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kyqX/wPqcVrrLtvA/RqDwo6FUcM/5iLCU4temwHdiYM=; b=Q9vjG56FFKu9Fupk
 rTl/jzXxjNSgMUPblmVVtcXl0TzBsAj10QUIUXlm1XSfoY2wRKxMPMR4DfhhukUk
 1rsG4o8aUPmFn0iAX5086dXNzp6NhYW3vqc62A0GP/3mIl3f1pRI2a75Qw4ohjOJ
 rQf7fnU8yoC2E7SYWL4Gh7Q9A1+NMS14euQu1o6w2TKEopasiQtG3o574ErnhsbP
 u8dYgEkLcChJ1XkvpKQtVk9BleU/QLtsn72aEZIoQ3vPtmWHWs4IW0nxP8s6FgXq
 VUKYpF+QJh7idSfJc6thV4qVeX6VS7Dv74eUtzk2LGKAqH8BVU8vGn1JsJEHM2o5
 3Ov7JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1phv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 15:17:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e66b3359f7so993386d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 07:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064636; x=1740669436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kyqX/wPqcVrrLtvA/RqDwo6FUcM/5iLCU4temwHdiYM=;
 b=Z+YydtBnDRkIFZaqzlXd6wHj2Vsj2dG/IrNLPPgAUBrSB2B9o7zWeLVXFH/cslbdD+
 llq6sW79ndVxvudIrjO8WWsIOMnDxZqax9ws3qFQiB2iZWMF2Gq2VG39iHgfON6Q76pn
 DfN67sfs5lwG+z9tqZEYzAeMP0P1lg3qcX0yw+7pOuBaoW/oG/PvR4yyeQyYZXqwnUV3
 SmarDHPq8oJurmem15iRuq6fR3Vh42r2TbKTeSV3T2bujXCYMSvSmveq582b2cCxvhXu
 VGNhFkdmD0J6cLW5sJhRum7TGNyxLq3YU/7UVm5QYiGi6l39m8qziTzyhHet/Mg5NhKg
 rwiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Pz84JfK3L7sn1fOEob5dCRJIYoJPzmxus+1OMX4PtsDyZJCXQpOjPFTBqkcGBYrlDfnqlQtKepY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykYE7xygl9hJJ9Itz2ekNaPHBulyMTiZ1Xxe2lb25+ebphO23k
 ji2k5+ve0SjrW0T2pq3V6N6IfLNkKGm3iEOsuZFG1h0Ol9WelljQUSboF6qVzZKPwVeNkguaVxU
 CQryglu/ce2TwbOxmb4cGEaqqekCdQrodcl76QJDYtomHTXZK0Y/pVOQt8U3MsLz2ztM=
X-Gm-Gg: ASbGncvGNs8ZrPkgPlyy6BgJ0tsG11c2oNuLPHTY0DEkQtcFUJnpL7yP9IU8CJdjq/l
 RQMYu2YJowaE0je5NtadU56TLwy9bBNJmeqDsSj+PutVYSfv3OVYYRDpk4ikYCk5BT+IjfTHDfH
 MIVU1W308EYrQL+XR76zS1UpH7izFwOdPAZPXUEYnjA/Gq9NckQekMh7PPGmARuBd6XhpGf4Wpv
 FXPcRzT2dz+aBD89WeW8P0HtOzqaX8EE8RO+ZyGZw5P7zWJOebfPp46CbIQVPsnbXZ3k0Oa31Wt
 qLTXJjMfw7f/s4bgqb4Y20bzjdzbufIneSSIrB1e3faLAe8aKILbHl57BOs=
X-Received: by 2002:a05:6214:d6f:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6e66cd0f7e5mr109551256d6.11.1740064635994; 
 Thu, 20 Feb 2025 07:17:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtyET8snLYOZ5UG6zsxyvaebgAOp1Lqtaa+U4eVMQcS6k6ousx/ewVzRncsaB9ipBkNQttnA==
X-Received: by 2002:a05:6214:d6f:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6e66cd0f7e5mr109550916d6.11.1740064635495; 
 Thu, 20 Feb 2025 07:17:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbbefd080asm517329366b.179.2025.02.20.07.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 07:17:15 -0800 (PST)
Message-ID: <b3b20d5f-6281-41c3-9769-6545c6782eea@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 16:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm: dts: qcom: apq8064: link LVDS clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WY--UPyZE9IcwN415dO2IO0ay-I66En5
X-Proofpoint-ORIG-GUID: WY--UPyZE9IcwN415dO2IO0ay-I66En5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=703 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200109
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
> to the MDP4 display controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
