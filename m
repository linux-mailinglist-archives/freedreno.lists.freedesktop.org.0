Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B3AB1368
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5E910EA2E;
	Fri,  9 May 2025 12:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZjXYxWo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090C710EA2F
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:31:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDwn0010134
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=; b=kZjXYxWoB1YUebRG
 f6ccXE5+Sl/v7vPq99CnhIpu+kqFGVnlF+8TfqDZvKsW4xdvINzbC2J9SJZDFCgI
 Uq52JtYhgCoQ/2k58qAjNFrG8XdSYt1PBbprQ9nAUnzuD+6XT3xbOaNevnRxkD5Y
 ZLh5gj+o8YLwoYlvgaTgL/Kj4gB6ZzxyHyq/3ayjGQKAGZEXGiWIgem9IH63QY1T
 /t8JmeqD3fbZFM/DhiI0pSgGjLOFQg7S3bqZbcH+sLS7C67U4zolRQ/Xvyevc1y8
 X9g62UfAmSqC2AwXvhZHJ9BC78JDSK+lopbCCJmK8fFHdYKKi+0orce2K00g58pZ
 EHwiIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7cqk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:31:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f5495bf0aeso3695656d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793871; x=1747398671;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=;
 b=EV6rHtqnTSBrNrHpxONEFladGR0VTXKVzQFrFvMldSefzqMoUlRP+L3ofosOqDXX69
 +kSF9dvxuSz2BuWYQNZw6LPDxrfM9l1cOulWOSt4pXAnbf2XgHLzTTuwezSdB1rdq2W5
 olPPLTGO+kIqkQ1ec9NFCXqIRMpJpJq81f3GMHseqz9fSR250a8gxxjlGU7IrPsF60Nl
 rEUjXV/2h6hbksVp0K1LsZZblKoL5Xk5QSImfPVcwBe77TnDA+31tcnp8pdFzmWHPnzG
 Z/WV9vAIHTtANP6ZvxKQsA9ObWeXXRy2hwEHt0dNAo/SMAsi9r7I7Ds9TNc9+RtUS6M8
 35bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXQPqTI9n8ofAWtNU6Cyvo7w8cB5c/PbcA2cXUj64wI8ierDTLXvAmVMX1/iq4hyVudN11uH+vmWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgwbMRuTecGF2bdfbv/2oGikbYZnTlnk1GmUX/h8ld8ZDdcTpg
 J8Jq31jXb+d09ibFhilJl76XyChY/vvqTLbMioxjxNZzX5thWyVMcD7YSx+jHiaOOcrV/7H6hFv
 nh54sa/CQXN+BLGHcrVRFIFzRXJZYSl8G34TaiPTbUylixRQNZFWQ4WPES3SULG5uGmI=
X-Gm-Gg: ASbGncsC1ejwUgqUJab3+LbPmLcrcZQUnugKPTKI9wCCiffFVdke9M0SIKya67ccazx
 WlsPQZwVaITho8/d09+nOpGpgxz44pAfVqt4bfobL7ybZjHepQqNDo3ALi3kejvOfFCRxi0l7EP
 CHGKb9VqrQEyHdQFjy6kYm6ocJUfcnxXMGclHtA1UuFNxJ3Ztp26cskiIQ+LQUDAber8zvDxAXN
 MYOdS7bxnCqbqtRp/YecgCh+qJjMBMeUcopRh5kEf6qem037CVvNCk1iWJqnZVmXBGzLuymdUy1
 gAEc3qBlm7aYIUIQdswQ2YjKYE5fU8SHbFE8ZLazRN40P5dfVXIkQXBsXJD7lf9qZ3E=
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id
 af79cd13be357-7cd01109256mr174579485a.7.1746793870965; 
 Fri, 09 May 2025 05:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgwqc5dmv1BuLfl2iNwP5xWwVZa7nyp8TxQ+UzvepLaRqf3krtNvF2xEsEPUvN4R2vKmFTQ==
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id
 af79cd13be357-7cd01109256mr174577685a.7.1746793870580; 
 Fri, 09 May 2025 05:31:10 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d70d55bsm1302110a12.65.2025.05.09.05.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:31:10 -0700 (PDT)
Message-ID: <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfX6Zz1L+H5MIUf
 Z5zkBYrT3Sh+ytcGNVI2xrWoLlHSXXi29AuB9QIeYDznxoBmLewPHIsR9YWtz0F1oBFf+XMRIc7
 KBQ490sI9ppNeD1/t9WZZBRDLnQXwCKiI/mhQXLVfZbzW3lv+km5RYMnIMS/bcxCDdB0HeeIHaz
 BawD5eo2vlwpVLZW/MACy2FXb6iqDBuprGsSuo9vQK7DWgJ4MM2z1tI2ZUZ9Ct3X6Tzeq+Pcl98
 JV7wG9ebCYFweWSXuy6xv3EwbZ36VFa7hlVhmwpgjsRVZgmuXH6RznlWvOSiXGrZyqo3AKZK9J5
 e2lwm6UpmHu+B+sdIBZYyARcZz9LXHMRPdoYQri07HJ7W/LmRiLloTzW+TEfYgkWuSS7qAQdnPx
 TZgfR5lbq894JWIm2yyvw7vGJVq1m6F1IC+G0xrc6oUO8Rad6pwkINobB4N3V9107e+Ar8fg
X-Proofpoint-GUID: TfopXJldnqaet2tMDoprgEEChwJShiVJ
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681df590 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dGexCodceDVc4I0WR1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: TfopXJldnqaet2tMDoprgEEChwJShiVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090121
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

On 5/8/25 8:41 PM, Rob Clark wrote:
> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Start the great despaghettification by getting a pointer to the common
>> UBWC configuration, which houses e.g. UBWC versions that we need to
>> make decisions.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>  }
>>
>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +       /* Inherit the common config and make some necessary fixups */
>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> 
> This does look a bit funny given the devm_kzalloc() below.. I guess
> just so that the ptr is never NULL?

Yeah, would you prefer this is changed?

Konrad
