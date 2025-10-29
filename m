Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885EBC198A1
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 10:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDFE10E76D;
	Wed, 29 Oct 2025 09:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPcOsO4r";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWKgHQ0v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825410E76C
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4vPDA3721063
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=; b=lPcOsO4r3SX6Ym/V
 XyPlofVFzvTrGI2l0UP5NsYv4j28pOhXcDNyo+1K9h4pcDMI8F/eaA0IrYvwiyyH
 ju/qnQ9MAPGJnMTXHV+I/tFOs7/EDWeklEj5SQqnvCn75dAmpeNCchuAdibM9iMJ
 kntrb2Ym0p+c3KKy1TDAqcNw4C5FUNycUxeN0/Th55oUEGSrcM8QjRLNz/io8uJ5
 AF9LsxT1iG2g7SAD1DGviacyfguXDCzx2vIMqLO4Kf3oG3JKehZA7QPJB8H3Wf8Y
 L3Q2ufs7iQDOsjrsnJnunM1jhwXVerjc6Zzba09+Src16zAcPIUKa/0d4eSQ6nmM
 Nm3+kw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a224bx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 09:59:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-290baa27f53so26913485ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761731994; x=1762336794;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=;
 b=OWKgHQ0vjMDmxzPASoYVg9rTUwE0xdud2sO8LnGzjw0ea7/ANeSWcU9WmHJGKv0mpx
 b5JXl14+TW9QCmjnrI0JhMXuaFhB+NM6Ssnh02HfsO2phIExI6BbcZvM12iNyCztpgh0
 YWnCey39WnBVVMzPT4x29QkoAd+mmJrhRtHkzb35yx4g0u8Z2x84m93O7KgsxKXIWDqR
 ylofcBxNRKt9XIEXOfnuyRbUJedolzyIlN2I7k2lB4mFmdcYZTzQFQJBUS1WlaR5QybB
 YHNcgCl/MgYaro17tnUj+QnkbftJMyQmAyMgefynRrAAyg4V5FWpkRrihzHP+menr/F6
 xRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761731994; x=1762336794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Piz8rod4lz0FtmBYgSwSVPwpSZnz6NSh0sr50I+nrGU=;
 b=Zfvy/DtB4G2IW4YYl5U6U0S+X+yiUDDRGRT2uAUrEC4qcPm2N/7/ialZRteGZinRRg
 Dii9+RRUMRNIu28LY/Bkxi4UyoxH85dq9/7s71gYb3WKBZAuGuoJX5tkOhETmJXeu/Ey
 x2hziuJW1f3wmNqS8PnYs9bxj4dH26sJzCsxOs/TVtnXbIzWG1YRcS4KpLD4Bdqhk3qo
 /mAG1lD1SPWDeXT0qZLXFgweDeuUZUmlNypT0lB+CNc6DxyZrcJE2bVyIM3lVQBIXi8e
 sDlUi992olIyoPB1WiWkaNqjFzCcPbBSY2luipfr2gL9lEI8s45mFFYYWNSwQZr7b7Pb
 E7Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmQWhJW232GVAyPe8f9Mebk+nOaGK54AFH1l4pSOooNTDTU4XxTjJoZ16RhrGo3tsGtdV3X3nnVPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzCbFEkJCXe/fqKOB7FtNCmWL347365/AXyhH9RRkPnpF2WGt1
 WhpGfLq6BIfR5JqLeN9kYZyKAAWsn0uL6D9AkeVr743/vY/cHeY44bBrUy7gcHyDPQDmC/morgm
 HP3D5f8mvuvjfm2vturbSGK8Y4v8ZhhGPfsgj3QOySp0peInsQnQrCGESmcTj/bfQb0kxsDs=
X-Gm-Gg: ASbGncv46ZOEuqLbJeNt1BZ/HzZzdPAWXYpl/1Js2EWvvXSiztmg/ab1leMzb9eO9Gi
 GlEcmky0+Yf0V7FSzV6UmYGyMjhzvR/WknRnGWmU2ObD5RzLenKybKz6XWIBtxhpb5xWQyrTDbl
 0fsdUxZF3sM86GVjYIgBbfvoQXRlmkOpstFlnx6SUoVeWDE1IsPGsPbibXxkBE1qGSydnF2IVyD
 0XIRicxMAEf8jGtH4v0dzw7ladrlkpnWXMQAsEeB5e7Gq/D3ZNUotGkGOacnwQqCh/2ARTtycL9
 MHBUn2H5ZuS0chjImhFKA/5RVgFVu7LU89/jEpd6EAgb8OZK6EOaH4QVuGVZCae4/YkyI0/jBS7
 WDuRZsom4MznrEJZcFpG9PqCWV8gyErYUbRKr3qe2qCeJy2H6r1QJgW+P9K/SO8bhdMuTlw==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-294deeedda7mr15829075ad.7.1761731993560; 
 Wed, 29 Oct 2025 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4z4olbHvLZYuxygnDrTvnj3GVSCIDXrQfTkLlCd2lWeeIOL0S3gFqI+0DsjMVOy8PFkbqAA==
X-Received: by 2002:a17:903:2f8d:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-294deeedda7mr15828705ad.7.1761731992999; 
 Wed, 29 Oct 2025 02:59:52 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d2789bsm144130825ad.62.2025.10.29.02.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:59:52 -0700 (PDT)
Message-ID: <7fcbb624-7c92-4043-b5aa-0fbfd3dd125c@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 17:59:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
 <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3NCBTYWx0ZWRfXzpNfP3vYCSU5
 EPialqcqcE7RYDkvXDTHKkpaJ35RO+S3z4PPrB5XckLWo4nAGVW+YqsvqlJMGhsSztRumH/HIod
 AtzU4jqc7F5n50jU/d8mMvPTYXn9wKOO8iVALt7KG7z0jb74K1ea6rkVt441JqGOaYxxof90Uvj
 W2pgj7VWZLz0Km6AuMhoARxPKM3wUUzrOyaTJJzUJTu2q45Gqeaz2yWHHzDX6iVjM08EarVXvEU
 HXxWLmaucaMVTOAQIF2ZYyYM3NFPIH72490+fhtmekiFScRSagfsTmT08iZgp6yAR4hTrZrAulV
 gbr3HbAz2J6Qa+AGQY4KAx3NSDarQJHwWPhhRz0vsUE2o3GXOEF536kjXLflcU758skC15OPXBd
 CuQCS19057jVkoNFQJ8NDoGJdD8Qnw==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901e59a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v3LxePKqoqSeXojOrL0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E6C5oF87AVCqFyMZF0ZEFursmDBALqvR
X-Proofpoint-ORIG-GUID: E6C5oF87AVCqFyMZF0ZEFursmDBALqvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290074
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


On 10/29/2025 4:00 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 01:21:02PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> - Adjusted indentation and added missing blank lines in the example.
>> - Corrected OPP clock values to match actual DTS configuration.
> See Documentation/process/submitting-patches.rst to check how to write
> proper commit messages.


Ok, will refer guide to update commit msg.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>>  1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -140,35 +140,37 @@ examples:
>>                  #size-cells = <0>;
>>  
>>                  port@0 {
>> -                  reg = <0>;
>> -                  dpu_intf0_out: endpoint {
>> -                  };
>> +                    reg = <0>;
>> +
>> +                    dpu_intf0_out: endpoint {
>> +                    };
>>                  };
>>  
>>                  port@1 {
>> -                  reg = <1>;
>> -                  dpu_intf1_out: endpoint {
>> -                      remote-endpoint = <&mdss_dsi0_in>;
>> -                  };
>> +                    reg = <1>;
>> +
>> +                    dpu_intf1_out: endpoint {
>> +                        remote-endpoint = <&mdss_dsi0_in>;
>> +                    };
>>                  };
>>              };
>>  
>>              mdp_opp_table: opp-table {
>>                  compatible = "operating-points-v2";
>>  
>> -                opp-19200000 {
>> -                  opp-hz = /bits/ 64 <19200000>;
>> -                  required-opps = <&rpmhpd_opp_low_svs>;
>> +                opp-192000000 {
> This is not necessary. This is just an example, so it doesn't matter,
> which values are actually written here.


Yes, but I think correct value is better?


>> +                    opp-hz = /bits/ 64 <192000000>;
>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>                  };
>>  
>> -                opp-25600000 {
>> -                  opp-hz = /bits/ 64 <25600000>;
>> -                  required-opps = <&rpmhpd_opp_svs>;
>> +                opp-256000000 {
>> +                    opp-hz = /bits/ 64 <256000000>;
>> +                    required-opps = <&rpmhpd_opp_svs>;
>>                  };
>>  
>>                  opp-307200000 {
>> -                  opp-hz = /bits/ 64 <307200000>;
>> -                  required-opps = <&rpmhpd_opp_nom>;
>> +                    opp-hz = /bits/ 64 <307200000>;
>> +                    required-opps = <&rpmhpd_opp_nom>;
>>                  };
>>              };
>>          };
>>
>> -- 
>> 2.34.1
>>
>>
