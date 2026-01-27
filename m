Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOGgNRrKeGmNtQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 15:22:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4E958D7
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 15:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC41910E57E;
	Tue, 27 Jan 2026 14:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1LqhODG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxUlE48i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8FB89149
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 14:22:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RAHwFN3714711
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 14:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T/zZBr4RQMGR6+8mwWzOZeCwVTQSBGms3epNbHc/lK4=; b=U1LqhODGZjRjomPG
 kj2Tn0IW2gH/YO2UfKr1oCd1wYuDd8oHGJPP66qCoKBW2rZAtmI6N3CyX4zEoqZ0
 xgsTESoghkgenLSBdK4vD/HQNat9JV6ESB+xedzP6a/TJf3HO6woc8nf/+QE4RP7
 VMcd3joH2Ony78XdvoNGaBcBkKWvAADACa3KDYdpEXzl1KaQtjtis1Al4jgWy7w7
 kSUMU4Wy4epR6XpRbAtD1gjaV8VqUOBa5RyRTogDNIckxCcs7HoThn9io+YubLtQ
 KR9g8m1fLu1t0rxLE+GXFROHHhTXhryhe71uvxkaGeo1Jw6nHsCvgP6pSl5v0MBG
 28zFhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0b99m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 14:22:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c710279d57so7924685a.3
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769523734; x=1770128534;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T/zZBr4RQMGR6+8mwWzOZeCwVTQSBGms3epNbHc/lK4=;
 b=kxUlE48iGlU8oWjD9TzEgdaEez5nb4TiDGYIJRv48KX9QLNUebUC4xWnw1WxGgzrtV
 iKasrL+j39wICQBvsa9e5kCIWR2sPOZlTbnLn+dKcjK9loxMV258vopqozW0NmaRFYgV
 ZsVqBjC3Sr15f7mWjh+YlsTA9VZZ0l+ViqZNdE8d4W/WO+Sw+npf39hCdcJgBXrb4Tln
 DqhuuFnzFfJdAW5uEYZeVEHg8wNhQunBAdsjjG3fs1yjaNGod7CZQeaz8rW1vtynEtcU
 wi0TfUBtPic+QEAXenR/Lgk3zeeiB7x9jhKCvWjdmFwcm6GVTre7l2/KzkUqJySNz4vV
 TmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769523734; x=1770128534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/zZBr4RQMGR6+8mwWzOZeCwVTQSBGms3epNbHc/lK4=;
 b=I1LJNB8TkbZV1CfceGaIrkkBQfkvKWIm1SQD6rpArpzR9u/apbzr/dx8YVDI50gIby
 wDQAriR+X5PD2vcv+r6ny4UkH4MR5xnsipnrhwQXVkekPvfoxHToD1Kw9zgtPmbyN80e
 J4SIicw2mlYXwmQoSiWtCY0Cvc6xuCnkx8KuBOxLNED/1vVzIpC1A33dJkghwMpLdJaX
 XCJ9zbc6fG5AfKaidOGfvsw2O6GGfMNv6hwEvMWgF8uszd4KRH9rrTCmQCuK2FjA4qqZ
 vSx599P0X9o2464O2n1QsVOyNU180O2SRi594BAxRIuP6f9vjbqmssmmb9e5VWVT1vQw
 30lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHJg73drHhuWqzjghzYdYe/EMYB9IEqCZ1K3GX/YuwXhOWccSbB8zjNRMah7IyPtOh18mf2DGMtzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtuFITTqhRg8UGYoy2ah8XSiNi0IyU5jvcbCyce27i3fg/3C2U
 DBKBOhpbvGHx7CKSTsCd0nK0y3ZdlTvKpFeSaTftE4tdPHN3dBFPY6dh5ap1CNHWCEuYx/ng75s
 /2RWc6BeoOVw2lwr2ItQY/2OhvO4Erb6dcUdGAFaYdNfwQPzSOiGSfHem6ItBfnYWtPfB0Oo=
X-Gm-Gg: AZuq6aKrLaJXDH5OccpYPvUGqKGh06E2Y98zzYmibzzrbjafX6xvbBjPARkSB4Ou43Z
 cTMSWXi1hJgQTDpIkzEnYYyzPq63Llmdo/kdBW8gb5cOBJadNc0chxk77IwJdIegdyUku71hK+b
 H2c7CJI05VaWUMn89fuS8W3rT7WYmaIw5T/g6CXTENGwe/MnBX++j8SnFMlDtFKen9AfsKo+MNG
 TqzURxO4ARnQygNTJvkRguZS2JMH26nJvwVjKG0QaeFXkn9lVAjxixuG9pk80hbo1G7IqFKlmrG
 Aa7x/T5PJEES1Vtm0BdNQePACCovlvpJ6eA5J3HlAJSepIBNqypCoYaXglTbhX9iJd4kyKhF+Q2
 4NNMcaTxbJCKOWOEoUYtvtuLZl0BsNuut7iVgMPEccYKby9BIQL9AlB7G+z8xXgWFkI0=
X-Received: by 2002:a05:620a:178a:b0:8b2:1f8d:f11d with SMTP id
 af79cd13be357-8c70b9046b6mr186422085a.2.1769523733772; 
 Tue, 27 Jan 2026 06:22:13 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:1f8d:f11d with SMTP id
 af79cd13be357-8c70b9046b6mr186414885a.2.1769523733146; 
 Tue, 27 Jan 2026 06:22:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b416ca5sm815011666b.25.2026.01.27.06.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:22:12 -0800 (PST)
Message-ID: <c243a067-c33e-4ada-831e-ec611208b191@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 15:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soc: qcom: smem: Expose DDR data from SMEM
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
 <20260109133612.ommcoivkbhbisp6o@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109133612.ommcoivkbhbisp6o@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zGHX08FZhw9k9vXbz2fTJjCH0ULZq-qC
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978ca16 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rBdmBs-3Ac6Y_iI8bpQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: zGHX08FZhw9k9vXbz2fTJjCH0ULZq-qC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExNyBTYWx0ZWRfX4m2FD7EPxW6u
 ZdHoNqLOyvpgVjO/3yEz4amjBgp5XoIsSiJ56e1Ud3n7u/xSDUIfbDpcBGR5+d0M3Ft5Wj20NCT
 wbKOXzA4MeA/2l0cZh3APTqY1P5lyiIbpvWUB1hMvtxScZnMDMcwAq+S94n2EudtbmIsq10vyiS
 ssYKR+0vfUs6ZFVOxq/PnXiIsOHNFlgFdFDVMrSADF/d7EyhmkNtPO8QcggxBywUnrgjMvhTreg
 RtzFJ1tW/uiVloU7KNgoM5xxMfYvlMPUn7ALsfUEFTkt0El/0TprcLMz13J7wNjODNiqxAJ998U
 LDwvgk9aIhfjH+qMzHO9OKXbjOfkdX/I8nRZkmgxYgrPxoH7gdx86Zs+L7QLbj7db8VSpE6nyjs
 Y16feeGVp0UtTTH01hWUy6onDI51gWjz1RQmRZQHFJPNF6rFuBbBi6ZXEjwEZxdcy10C0sBHQQX
 NEckpUoU2Ley7EyHmBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270117
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:konradybcio@kernel.org,m:andersson@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 33B4E958D7
X-Rspamd-Action: no action

On 1/9/26 2:36 PM, Mukesh Ojha wrote:
> On Thu, Jan 08, 2026 at 03:21:50PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Most modern Qualcomm platforms (>= SM8150) expose information about the
>> DDR memory present on the system via SMEM.

[...]

>> @@ -1236,17 +1241,24 @@ static int qcom_smem_probe(struct platform_device *pdev)
>>  
>>  	__smem = smem;
>>  
>> +	smem->debugfs_dir = smem_dram_parse(smem->dev);
> 
> Is it possible, even after calling qcom_smem_is_available() before calling 
> qcom_smem_dram_get_hbb() we are getting __dram as NULL.
> 
> is it good to move __smem assignment to the end with barrier so all the
> changes before the assignment are seen when somebody checking qcom_smem_is_available()
> with a pair smp store/release pair.

I think just moving the __smem assignment down will be enough, no?

What scenario do you have in mind that would require SMP barriers?

[...]

>> +struct smem_dram {
>> +	unsigned long frequencies[MAX_DDR_FREQ_NUM_V5];
>> +	u32 num_frequencies;
> 
> freq and num_freq_entries ? since you have used freq at various places..

The names in structs come from internal shmem definitions that I didn't
want to stray away from

Making the kernel-side struct fields named the same feels like added
confusion to me

[...]

>> +	if (size == sizeof(struct ddr_details_v5)
>> +		 + 4 * sizeof(struct ddr_region_v5)
>> +		 + sizeof(struct ddr_xbl2quantum_smem_data)
>> +		 + sizeof(struct shub_freq_plan_entry))
>> +		return INFO_V5;
> 
> Why this does not have separate name ?

Because it's the same DDR info structure as "normal v5", with trailing
extras that we don't really care about

[...]

>> +struct dentry *smem_dram_parse(struct device *dev)
>> +{
>> +	struct dentry *debugfs_dir;
>> +	enum ddr_info_version ver;
>> +	struct smem_dram *dram;
>> +	size_t actual_size;
>> +	void *data = NULL;
>> +
>> +	/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
> 
> This comment seems redundant..

With this one specifically, I don't agree it's obvious..

Konrad
